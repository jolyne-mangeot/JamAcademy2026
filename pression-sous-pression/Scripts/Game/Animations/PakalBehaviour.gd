extends Node

@export var side:TextureRect
@export var front:TextureRect
@export var sidepipe:TextureRect
@export var frontpipe:TextureRect

var cooldown:float = 0.0
var pipe:bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if cooldown > 0.0:
		cooldown -= delta
		if cooldown <= 0.0:
			cooldown = 0.0
			front.visible = false
			side.visible = true
			if pipe == true:
				frontpipe.visible = false
				sidepipe.visible = true


func _on_client_wrong_drink_given() -> void:
	cooldown = 1.0
	%Buble.play()
	if sidepipe.visible == true:
		pipe = true
		sidepipe.visible = false
		frontpipe.visible = true
	side.visible = false
	front.visible = true
