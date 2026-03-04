extends Node

@onready var pause_menu: Control = $Control/PauseMenu/PauseMenu

var satisfaction: int = 51
var message: String

func _satisfaction():
	if satisfaction > 75:
		message = "Your son loves you.\nIt fills you with determination..."
	elif satisfaction > 50:
		message = "Your son is proud of you!\n Keep up the good work!"
	elif satisfaction > 25:
		message = "Your son is getting hungry.\n"
	else:
		message = "Your son might soon be going with your ex-partner.\n"
	$message.text = message
 
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().paused = !get_tree().paused
		pause_menu.visible = get_tree().paused
