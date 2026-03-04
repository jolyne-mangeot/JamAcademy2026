extends Node

@onready var pause_menu: Control = $Control/PauseMenu/PauseMenu

func _ready():
	GameManager.money_count -= GameManager.daily_rent
	if GameManager.money_count < 0:
		get_node("buttons/defeat_button").visible = true
	else:
		get_node("buttons/shop_button").visible = true
 
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().paused = !get_tree().paused
		pause_menu.visible = get_tree().paused


func _on_shop_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Upgrade.tscn")


func _on_defeat_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu Scene.tscn")
