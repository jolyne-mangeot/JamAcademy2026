extends Node

@export var clients_slots:Array[Control]


func _on_timer_timeout() -> void:
	if clients_slots[0].client_alive == false:
		clients_slots[0].init_client()
