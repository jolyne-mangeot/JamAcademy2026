extends Label
var satisfaction: int = GameManager.calculate_satisfaction()
var message: String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_satisfaction()

func _satisfaction():
	if GameManager.money_count < 0:
		message = "You ran out of money ! Your dream of ever finding your love again are all shattered."
	elif satisfaction > 75:
		message = "Your son loves you. It fills you with determination..."
	elif satisfaction > 50:
		message = "Your son is proud of you! Keep up the good work!"
	elif satisfaction > 25:
		message = "Your son is getting hungry."
	else:
		message = "Your son might soon be going with your ex-partner."
	text = message
