extends Control

@export var working_hours_per_day: int = 7.0
@export var starting_hour: float = 15.0
@export var seconds_per_hours: int = 30.0

@onready var timer: Timer = $Level/timer_day

var starting_money: float = 0.0

var time_in_hours: float = 0.0
var total_day_length: float = 0.0

@onready var pause_menu: Control = $CanvasLayer/PauseMenu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().paused = !get_tree().paused
		pause_menu.visible = get_tree().paused


func _on_timer_day_timeout() -> void:
	pass
