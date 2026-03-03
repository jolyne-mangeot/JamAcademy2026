extends Node

@onready var timer_bar: ProgressBar = $Timer_progress
@export var wait_time: float = 25.0
@onready var timer: Timer = $Timer_leaving
@onready var orders_scene = preload("res://Scenes/Game/Orders.tscn")
var order
var client_id:int = 0
var time_left: float = wait_time
var progress_percent: float = 0.0

signal client_left()
signal order_accept(id: int, order)
signal order_over(id: int)

func _ready() -> void:
	pass

func init_self() -> void:
	timer.wait_time = wait_time
	timer.timeout.connect(_on_timer_timeout)
	timer.start()
	timer_bar.value = 1.0
	spawn_orders()

func _process(delta: float) -> void:
	if timer.is_stopped():
		return
	time_left -= delta
	timer_bar.value = time_left / wait_time

func _on_timer_timeout() -> void:
	print("Time stop")
	client_left.emit()
	queue_free()

func spawn_orders() -> void:
	order = orders_scene.instantiate()
	get_tree().root.add_child(order)


func _on_button_pressed() -> void:
	if timer.is_stopped():
		return
	else:
		order_accept.emit(client_id, order)


func _on_command_hook_order_accepted(id: int) -> void:
	timer.stop()
	timer_bar.free()
	print("Command accepted")


func _on_glass_dropped(glass_type: String) -> void:
	pass # Replace with function body.
