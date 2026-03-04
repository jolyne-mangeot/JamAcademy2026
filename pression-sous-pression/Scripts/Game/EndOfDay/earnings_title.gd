extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.money_count -= GameManager.daily_rent
	text = "Earnings: " + str(GameManager.money_count)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = "Earnings: " + str(GameManager.money_count)
