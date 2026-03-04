extends Node

@onready var pause_menu: Control = $Control/PauseMenu/PauseMenu
@onready var shop_button: Button = $buttons/shop_button
@onready var defeat_button: Button = $buttons/defeat_button

func _ready():
	GameManager.money_count -= GameManager.daily_rent
	if GameManager.money_count < 0:
		defeat_button.visible = true
	elif GameManager.day_count == 7:
		defeat_button.visible = true
	else:
		shop_button.visible = true
 

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().paused = !get_tree().paused
		pause_menu.visible = get_tree().paused


func _on_shop_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Upgrade.tscn")


func _on_defeat_button_pressed() -> void:
	if GameManager.day_count < 7:
		get_tree().change_scene_to_file("res://Scenes/Endings/Thx.tscn")
	elif GameManager.coffee_in_bokal >= 6:
		get_tree().change_scene_to_file("res://Scenes/Endings/CoffeeEnding.tscn")
	elif GameManager.pastis_in_bokal >= 6:
		get_tree().change_scene_to_file("res://Scenes/Endings/PastisEnding.tscn")
	elif GameManager.beer_in_bokal >= 6:
		get_tree().change_scene_to_file("res://Scenes/Endings/BeerEnding.tscn")
	elif (GameManager.beer_in_bokal + GameManager.pastis_in_bokal + GameManager.coffee_in_bokal) >= 6:
		get_tree().change_scene_to_file("res://Scenes/Endings/IntoxicationEnding.tscn")
	elif GameManager.money_count < 0:
		get_tree().change_scene_to_file("res://Scenes/Endings/Defeat.tscn")
	elif GameManager.money_count > 0:
		get_tree().change_scene_to_file("res://Scenes/Endings/Victory.tscn")
