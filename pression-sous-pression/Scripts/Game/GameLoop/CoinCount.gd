extends Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = "COIN COUNT: " + str(GameManager.money_count) 

func _on_client_order_over(id: int) -> void:
	text = "COIN COUNT: " + str(GameManager.money_count) 
