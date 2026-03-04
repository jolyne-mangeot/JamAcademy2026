extends Node

@export var slides:Array[Node]
@export var texts:Array[Node]
var slide_index: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	slides[slide_index].visible = true
	texts[slide_index].visible = true


func _on_next_pressed() -> void:
	slide_index += 1
	if slide_index == slides.size():
		get_tree().change_scene_to_file("res://Scenes/Menu Scene.tscn")
	else:
		if slide_index > 0:
			slides[slide_index - 1].visible = false
			texts[slide_index - 1].visible = false
		slides[slide_index].visible = true
		texts[slide_index].visible = true
