extends Sprite2D

@export var glass_type:String
var origin_position:Vector2 = position
var reference_layer = z_index
var is_dragging:bool = false
var delay = 3
signal glass_dropped(glass_type:String)


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
				z_index = 999
				is_dragging = true
		elif is_dragging == true:
			z_index = reference_layer
			is_dragging = false
			glass_dropped.emit(glass_type)
