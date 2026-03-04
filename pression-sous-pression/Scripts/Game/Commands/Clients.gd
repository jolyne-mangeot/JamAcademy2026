extends Node

@onready var timer_bar: ProgressBar = $Timer_progress
var accept_count_down: float = randi_range(5, 25)
var order_count_down: float = accept_count_down * 2
@onready var timer: Timer = $Timer_leaving
@export var client_id:int
var client_alive:bool = false
var order
var order_time_left: float = order_count_down
var order_in_progress:bool = false
var time_left: float = accept_count_down
var progress_percent: float = 0.0
var is_hovered:bool = false
var is_count_down: bool = false
var drinks_paid: float


signal order_fulfilled()
signal order_failed()
signal order_accept(id: int, order)
signal order_over(id: int)
signal drink_given(glass_type: String)


func init_client() -> void:
	timer.wait_time = accept_count_down
	timer.start()
	client_alive = true
	self.visible = true
	timer_bar.value = 1.0
	timer_bar.visible = true
	order_in_progress = false
	spawn_orders()


func _process(delta: float) -> void:
	if order_in_progress == true:
		order_time_left -= delta
		order.progress_bar.value = order_time_left / order_count_down
		if order_time_left <= 0.0:
			order_failed.emit()
			_on_timer_timeout()
	if timer.is_stopped() || client_alive == false:
		time_left = accept_count_down
		timer_bar.value = time_left / accept_count_down
		return
	time_left -= delta
	timer_bar.value = time_left / accept_count_down


func _on_timer_timeout() -> void:
	if client_alive == false || order_in_progress == false:
		return
	if order.drink_amount < order.total_drinks:
		if order.drink_amount == 0:
			drinks_paid = order.total_drinks
		else:
			drinks_paid = (order.total_drinks - order.drink_amount) * 0.8
		if order.types == "red" || order.types == "brown" || order.types == "blond":
			GameManager.money_count += int(5 * drinks_paid)
		else:
			GameManager.money_count += int(3 * drinks_paid)
		%CoinSound.play()
	order_over.emit(client_id)
	order.free()
	client_alive = false
	self.visible = false
	order_in_progress = false


func spawn_orders() -> void:
	order_time_left = order_count_down
	order = preload("res://Scenes/Game/Orders.tscn").instantiate()
	order.client_id = client_id
	order.init_order()
	get_tree().root.add_child(order)


func _on_button_pressed() -> void:
	if timer.is_stopped():
		return
	else:
		order_accept.emit(client_id, order)
		time_left = accept_count_down
		timer_bar.value = time_left / accept_count_down


func _on_command_hook_order_accepted(id: int) -> void:
	if id == client_id && client_alive == true:
		%BellOrder.play()
		timer.stop()
		timer_bar.visible = false
		order_in_progress = true
		print("Command accepted")


func _on_glass_dropped(glass_type: String) -> void:
	if order_in_progress == false:
		return
	if is_hovered == true:
		drink_given.emit(glass_type)
		if order.check_drink(glass_type) == false:
			%AnnoyedSound.play()
			order_failed.emit()
			_on_timer_timeout()
		else:
			var sound = RandomNumberGenerator.new().randi_range(1,4)
			if sound == 1:
				%GlassSound.play()
			elif sound == 2:
				%GlassSound2.play()
			elif sound == 3:
				%GlassSound3.play()
			elif sound == 4:
				%GlassSound4.play()
			order.update_order()
			if order.drink_amount <= 0:
				order_fulfilled.emit()
				_on_timer_timeout()


func _on_mouse_entered() -> void:
	is_hovered = true


func _on_mouse_exited() -> void:
	is_hovered = false
