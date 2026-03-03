extends Sprite2D

@export var origin_position:Vector2
var is_dragging = false
var mouse_offset
var delay = .2
var drop_spots

func _ready():
	drop_spots = get_tree().get_nodes_in_group("drop_spot_group")
	print(drop_spots)
func _physics_process(delta):
	if is_dragging == true:
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", get_global_mouse_position(), delay * delta)
	elif is_dragging == false:
		position = origin_position


func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			if get_rect().has_point(to_local(event.position)):
				is_dragging = true
		else:
			is_dragging = false
