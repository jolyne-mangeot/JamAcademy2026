extends Node2D

var RNG = RandomNumberGenerator.new()

var num_orders: int = 0

var types: String = ""

var list_types: Array[String] = ["red", "brown", "blond", "coffee"]

func get_random_int(min_val: int, max_val: int) -> int:
	return RNG.randi_range(min_val, max_val)

func _ready() -> void:
	RNG.randomize()
	num_orders = get_random_int(0,9)
	print(num_orders)
	types = list_types.pick_random()
	print(types)
	

func _process(delta: float) -> void:
	pass
