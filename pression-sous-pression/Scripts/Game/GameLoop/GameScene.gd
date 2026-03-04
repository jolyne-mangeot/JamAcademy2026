extends Control


@onready var pause_menu: Control = $CanvasLayer/PauseMenu
@onready var timer: Timer = $timer_day
@onready var label: Label = $countdown_time
@export var daylabel: Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = true
	daylabel.text = GameManager.current_day
	await get_tree().create_timer(3.0).timeout
	get_node("DayAnnouncement").visible = false
	get_tree().paused = false
	timer.start(GameManager.day_duration)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mod_wait_time = int(fmod(timer.time_left, 60))
	if mod_wait_time < 10:
		label.text = str(int(timer.time_left / 60)) + ":0" + str(mod_wait_time)
	else:
		label.text = str(int(timer.time_left / 60)) + ":" + str(mod_wait_time)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().paused = !get_tree().paused
		pause_menu.visible = get_tree().paused


func _on_timer_day_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/End Of Day.tscn")
