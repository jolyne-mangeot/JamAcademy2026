extends Node

var prep_time:float = 4.0
var timer:float = 0.0
var is_pouring:bool = false
var is_occupied:bool = false
var mouse_hovering:bool = false
@export var progress:ProgressBar
@export var empty_glass:TextureRect
@export var full_glass:Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_pouring == true:
		timer += delta
		progress.value = timer / prep_time
		if timer >= prep_time:
			is_pouring = false
			progress.visible = false
			empty_glass.visible = false
			full_glass.visible = true
			%CoffeeSound.stop()


func _on_coffee_cup_dropped(glass_type: String) -> void:
	if glass_type == "coffee cup" && is_occupied == false && is_pouring == false && mouse_hovering == true:
		empty_glass.visible = true
		is_pouring = true
		%CoffeeSound.play()
		is_occupied = true
		progress.value = 0.0
		progress.visible = true
		timer = 0.0


func _on_mouse_entered() -> void:
	mouse_hovering = true


func _on_mouse_exited() -> void:
	mouse_hovering = false


func _on_client_drink_given(glass_type: String) -> void:
	if glass_type == "coffee":
		full_glass.visible = false
		is_occupied = false
