extends Node

var RNG = RandomNumberGenerator.new()

@export var amount_label:Label
var num_orders: int = 0
var types: String = ""
var list_types: Array[String] = ["red", "brown", "blond", "coffee", "pastis"]
var visual:TextureRect


func get_random_int(min_val: int, max_val: int) -> int:
	return RNG.randi_range(min_val, max_val)

func _ready() -> void:
	RNG.randomize()
	num_orders = get_random_int(1,4)
	print(num_orders)
	types = list_types.pick_random()
	#visual = get_node(types)
	print(types)
	#amount_label.text = "x" + str(num_orders)
	#visual.visible = true

func _process(delta: float) -> void:
	pass
