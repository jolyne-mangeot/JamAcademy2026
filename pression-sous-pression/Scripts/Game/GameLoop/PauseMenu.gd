extends Control

@onready var resume_button: Button = $MarginContainer/VBoxContainer/ResumeButton
@onready var quit_button: Button = $MarginContainer/VBoxContainer/QuitButton
@onready var menu_button: Button = $MarginContainer/VBoxContainer/MainMenuButton


func _ready() -> void:
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_resume_button_pressed() -> void:
	get_tree().paused = false
	visible = false


func _on_main_menu_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/Menu Scene.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()
