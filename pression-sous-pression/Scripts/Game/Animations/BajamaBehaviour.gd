extends Control

@export var busuy:TextureRect
@export var happuy:TextureRect

var cooldown:float = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if cooldown > 0.0:
		cooldown -= delta
		if cooldown <= 0.0:
			cooldown = 0.0
			happuy.visible = false
			busuy.visible = true


func _on_client_order_fulfilled() -> void:
	cooldown = 1.5
	busuy.visible = false
	happuy.visible = true
