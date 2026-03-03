extends Node

@onready var timer_bar: ProgressBar = $Timer_progress
var accept_count_down: float = 25.0
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

signal client_left()
signal order_fulfilled()
signal order_failed()
signal order_accept(id: int, order)
signal order_over(id: int)


func init_client() -> void:
	timer.wait_time = accept_count_down
	timer.start()
	client_alive = true
	self.visible = true
	timer_bar.value = 1.0
	timer_bar.visible = true
	spawn_orders()


func _process(delta: float) -> void:
	if order_in_progress == true:
		order_time_left -= delta
		order.progress_bar.value = order_time_left / order_count_down
		if order_time_left <= 0.0:
			order_failed.emit()
			order_over.emit(client_id)
			_on_timer_timeout()
	if timer.is_stopped() || client_alive == false:
		return
	time_left -= delta
	timer_bar.value = time_left / accept_count_down


func _on_timer_timeout() -> void:
	print("Time stop")
	client_left.emit()
	order.free()
	self.visible = false
	order_in_progress = false
	client_alive = false


func spawn_orders() -> void:
	order_time_left = order_count_down
	order = preload("res://Scenes/Game/Orders.tscn").instantiate()
	order.init_order()
	order.client_id = client_id
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
		timer.stop()
		timer_bar.visible = false
		order_in_progress = true
		print("Command accepted")


func _on_glass_dropped(glass_type: String) -> void:
	if client_alive == false:
		return
	if is_hovered == true:
		if order.check_drink(glass_type) == false:
			order_failed.emit()
			order_over.emit(client_id)
			_on_timer_timeout()
		else:
			order.update_order()
			if order.drink_amount <= 0:
				order_fulfilled.emit()
				order_over.emit(client_id)
				_on_timer_timeout()


func _on_mouse_entered() -> void:
	is_hovered = true


func _on_mouse_exited() -> void:
	is_hovered = false
