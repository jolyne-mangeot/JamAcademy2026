extends Node2D

@onready var timer_bar: ProgressBar = $Timer_progress

@export var wait_time: float = 25.0

@onready var timer: Timer = $Timer_leaving

var time_left: float = wait_time

var progress_percent: float = 0.0

func _ready() -> void:
	timer.wait_time = wait_time
	timer.one_shot = true
	timer.timeout.connect(_on_timer_timeout)
	timer.start()
	timer_bar.value = 100.0
	
func _process(delta: float) -> void:
	if timer.is_stopped():
		return
		
	time_left -= delta
	progress_percent = (time_left / wait_time) * 100.0
	timer_bar.value = progress_percent

func _on_timer_timeout() -> void:
	print("Time stop")
	queue_free()
