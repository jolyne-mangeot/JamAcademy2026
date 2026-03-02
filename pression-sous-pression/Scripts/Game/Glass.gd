extends Node

var is_dragged:bool = false
var offset:Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_dragged is true:
		get_global_mouse_position() - offset
	pass


func _gui_input(event) -> void:
	pass
