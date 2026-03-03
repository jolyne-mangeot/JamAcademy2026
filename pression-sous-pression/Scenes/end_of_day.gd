extends Node

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
 
