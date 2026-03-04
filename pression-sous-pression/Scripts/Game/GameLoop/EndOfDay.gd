extends Node

@onready var pause_menu: Control = $Control/PauseMenu/PauseMenu
@onready var shop_button: Button = $buttons/shop_button
@onready var defeat_button: Button = $buttons/defeat_button

func _ready():
	GameManager.money_count -= GameManager.daily_rent
	if GameManager.money_count < 0:
#		if the rent is highter than what was gained it goes immediatly to the thx menu
		#get_node("buttons/defeat_button").visible = true
		defeat_button.visible = true
		_on_defeat_button_pressed()
	elif GameManager.day_count == 7:
		#get_node("buttons/defeat_button").visible = true
		defeat_button.visible = true
		_on_defeat_button_pressed()
	else:
		#get_node("buttons/shop_button").visible = true
		shop_button.visible = true
		_on_shop_button_pressed()
 
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().paused = !get_tree().paused
		pause_menu.visible = get_tree().paused


func _on_shop_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Upgrade.tscn")


func _on_defeat_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Thx.tscn")
