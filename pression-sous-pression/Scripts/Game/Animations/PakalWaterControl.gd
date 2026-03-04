extends Node

var is_hovered:bool = false
signal drink_given(glass_type: String)
@export var pipe:TextureRect

func _on_mouse_entered() -> void:
	is_hovered = true


func _on_mouse_exited() -> void:
	is_hovered = false


func _on_glass_dropped(glass_type: String) -> void:
	if is_hovered == true:
		if GameManager.pakal_fed == false:
			if glass_type == "pipe":
				pipe.visible = true
				GameManager.pakal_fed = true
				GameManager.pakal_smoked_days += 1
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
