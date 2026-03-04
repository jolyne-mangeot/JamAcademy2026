extends Label

var message: String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var satisfaction: float = float(float(GameManager.fulfilled_orders) / float(GameManager.customer_present))
	if GameManager.money_count < 0:
		message = "You ran out of money ! Your dream of ever finding your love again are all shattered."
	elif satisfaction >= 0.75:
		%Applause.play()
		message = "Your son loves you. It fills you with determination..."
	elif satisfaction >= 0.5:
		%cough.play()
		message = "Your son is proud of you! Keep up the good work!"
	elif satisfaction >= 0.25:
		%Boo.play()
		message = "Your son is getting hungry."
	else:
		%Boo.play()
		message = "Your son might soon be going with your ex-partner."
	text = message
