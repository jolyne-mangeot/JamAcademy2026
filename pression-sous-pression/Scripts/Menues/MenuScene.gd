extends Control


@onready var start_button: Button = $VBoxContainer/Start_button
@onready var quit_button: Button = $VBoxContainer/Quit_button
@onready var settings_button: Button = $VBoxContainer/Settings_button

func _ready() -> void:
	print("Testst")
	$VBoxContainer/Start_button.grab_focus()


func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
	GameManager.start_game()
	get_tree().change_scene_to_file("res://Scenes/Intro Scene.tscn")


func _on_settings_button_pressed() -> void:
	get_tree().change_scene_to_file(("res://Scenes/Settings Scene.tscn"))


func _on_quit_button_pressed() -> void:
	get_tree().quit()
