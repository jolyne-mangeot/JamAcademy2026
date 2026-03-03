extends Control

@onready var pause: Control = $PauseMenu/PauseMenu
@onready var next_button: Button = $CanvasLayer/Next_day_button

@onready var delay_button: Button = $CanvasLayer/VBoxContainer/delay_client_button
@onready var pourboire_button: Button = $CanvasLayer/VBoxContainer/Pourboire_enhancement
@onready var max_order_button: Button = $CanvasLayer/VBoxContainer/max_order_button
@onready var time_button: Button = $CanvasLayer/VBoxContainer/Time_enhancement_tap

func _ready() -> void:
	next_button.pressed.connect(_on_next_day_button_pressed)
	
	delay_button.pressed.connect(_on_delay_client_button_pressed)
	pourboire_button.pressed.connect(_on_pourboire_enhancement_pressed)
	time_button.pressed.connect(_on_time_enhancement_tap_pressed)
	max_order_button.pressed.connect(_on_max_order_button_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().paused = !get_tree().paused
		pause.visible = get_tree().paused


func _on_next_day_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Game Scene.tscn")
	

func _on_time_enhancement_tap_pressed() -> void:
	pass


func _on_pourboire_enhancement_pressed() -> void:
	pass # Replace with function body.


func _on_max_order_button_pressed() -> void:
	pass # Replace with function body.


func _on_delay_client_button_pressed() -> void:
	pass # Replace with function body.
