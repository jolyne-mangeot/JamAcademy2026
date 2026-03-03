extends Control

var RNG = RandomNumberGenerator.new()

var amount_label:Label
var id_label:Label
var progress_bar:ProgressBar
var drinks:Array[Node]
var drink_amount: int = 0
var drink_id:int
var types: String = ""
var list_types: Array[String] = ["red", "brown", "blond", "coffee", "pastis"]
var client_id:int
var visual:TextureRect


func check_drink(glass_type:String) -> bool:
	if glass_type == types:
		return true
	return false

func update_order() -> void:
	drink_amount -= 1
	amount_label.text = "x"+str(drink_amount)

func get_random_int(min_val: int, max_val: int) -> int:
	return RNG.randi_range(min_val, max_val)


func init_order() -> void:
	amount_label = get_node("koko")
	id_label = get_node("id")
	progress_bar = get_node("order_bar")
	drinks = [get_node("red"), get_node("brown"), get_node("blond"), get_node("coffee"), get_node("pastis")]
	RNG.randomize()
	drink_amount = get_random_int(1,4)
	print(drink_amount)
	drink_id = get_random_int(0,4)
	types = list_types[drink_id]
	visual = drinks[drink_id]
	print(types)
	amount_label.text = "x"+str(drink_amount)
	id_label.text = str(client_id)
	visual.visible = true
