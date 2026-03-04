extends Label

var message: String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GameManager.coffee_in_bokal + GameManager.pastis_in_bokal + GameManager.beer_in_bokal >= 3:
		text = "Pakal doesn't feel so well..."
	else:
		text = "Pakal is healthy !"
