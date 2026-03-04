extends Label
var satisfaction: int = GameManager.satisfaction
var message: String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_satisfaction()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_satisfaction()

func _satisfaction():
	if satisfaction > 75:
		message = "Your son loves you.\nIt fills you with determination..."
	elif satisfaction > 50:
		message = "Your son is proud of you!\n Keep up the good work!"
	elif satisfaction > 25:
		message = "Your son is getting hungry.\n"
	else:
		message = "Your son might soon be going with your ex-partner.\n"
	text = message
