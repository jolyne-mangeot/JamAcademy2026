extends Node

@onready var pause_menu: Control = $Control/PauseMenu/PauseMenu

 
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().paused = !get_tree().paused
		pause_menu.visible = get_tree().paused


func _on_shop_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Upgrade.tscn")
