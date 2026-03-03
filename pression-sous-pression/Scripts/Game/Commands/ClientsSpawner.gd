extends Node

@export var clients_slots:Array[Control]
var free_chairs:Array[Control]


func _on_timer_timeout() -> void:
	free_chairs = []
	for chair in clients_slots:
		if chair.client_alive == false:
			free_chairs.append(chair)
	if free_chairs.size() > 0:
		free_chairs.pick_random().init_client()
