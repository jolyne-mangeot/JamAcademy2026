extends Control

@onready var volume_button: CheckButton = %VolumeButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VolumeButton.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu Scene.tscn")


func _on_volume_button_pressed() -> void:
	var master_bus_index = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_mute(master_bus_index, !AudioServer.is_bus_mute(master_bus_index))
