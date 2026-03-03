extends Node

var is_free:bool = true
var current_id:int = 0
@export var command_pos:Vector2

@export var hook_1:TextureRect
@export var hook_2:TextureRect

signal order_accepted(id: int)


func _on_client_order_accept(id: int, order: Variant) -> void:
	if is_free == true && hook_1.current_id != id && hook_2.current_id != id:
		current_id = id
		order_accepted.emit(id)
		is_free = false
		order.position = command_pos
		order.visible = true


func _on_client_order_over(id: int) -> void:
	if id == current_id:
		current_id = 0
		is_free = true
