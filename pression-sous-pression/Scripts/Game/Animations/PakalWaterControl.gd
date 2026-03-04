extends Node

var is_hovered:bool = false
signal drink_given(glass_type: String)
@export var pipe:TextureRect

func _ready() -> void:
	if GameManager.pastis_in_bokal > 0 && GameManager.coffee_in_bokal == 0 && GameManager.beer_in_bokal == 0:
		get_node(str("Yellow " + str(int(GameManager.pastis_in_bokal / 2) + 1))).visible = true
	elif GameManager.beer_in_bokal > 0 && GameManager.coffee_in_bokal == 0 && GameManager.pastis_in_bokal == 0:
		get_node(str("Brown " + str(int(GameManager.beer_in_bokal / 2) + 1))).visible = true
	elif GameManager.coffee_in_bokal > 0 || GameManager.beer_in_bokal > 0 || GameManager.pastis_in_bokal > 0:
		var pipi: int = GameManager.coffee_in_bokal + GameManager.beer_in_bokal + GameManager.pastis_in_bokal
		get_node(str("Black " + str(int(pipi / 2) + 1))).visible = true
	else:
		get_node("Day1 Water").visible = true


func _on_mouse_entered() -> void:
	is_hovered = true


func _on_mouse_exited() -> void:
	is_hovered = false


func _on_glass_dropped(glass_type: String) -> void:
	if is_hovered == true:
		if GameManager.pakal_fed == false:
			if glass_type == "pipe":
				pipe.visible = true
				GameManager.pakal_smoked_days += 1
				GameManager.pakal_fed = true
			if glass_type == "red" || glass_type == "brown"|| glass_type == "blond":
				GameManager.beer_in_bokal += 1
				GameManager.pakal_fed = true
				drink_given.emit(glass_type)
			elif glass_type == "coffee":
				GameManager.coffee_in_bokal += 1
				GameManager.pakal_fed = true
				drink_given.emit(glass_type)
			elif glass_type == "pastis":
				GameManager.pastis_in_bokal += 1
				GameManager.pakal_fed = true
				drink_given.emit(glass_type)
