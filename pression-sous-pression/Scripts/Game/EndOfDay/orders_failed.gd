extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = "Orders uncompleted: "  + str(GameManager.incomplete_orders)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = "Orders uncompleted: "  + str(GameManager.incomplete_orders)
