extends Node

var audio_muted:bool = false
var Order_types: Array[String] = ["red", "brown", "blond", "coffee", "pastis"]
var days: Array[String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
var max_drinks_ordered_supp: Array[int] = [1, 1, 2, 2, 3, 4]
var client_spawn_delay_supp: Array[float] = [0.5, 1.0, 1.0, 1.5, 2.0, 2.0]

# resets every game
var day_count: int = 1
var current_day: String = days[day_count - 1]
var customer_present: int = 0
var accepted_orders: int = 0
var fulfilled_orders: int = 0
var incomplete_orders: int = 0
var money_count: int = 0
var daily_rent: int = 30
var client_patience: float = 40
var satisfaction: int = 51

var pakal_fed: bool = false
var pakal_smoked_days: int = 0
var coffee_in_bokal: int = 0
var pastis_in_bokal: int = 0
var beer_in_bokal: int = 0

# upgrades
var max_drinks_ordered: int = 2
var client_spawn_delay:float = 13.5
var pourboire_enhancement:float = 1.0

var day_duration:float = 120.0


func start_game() -> void:
	max_drinks_ordered_supp = [1, 1, 2, 2, 3, 4]
	client_spawn_delay_supp = [1.5, 2.0, 2.5, 2.5, 3.0, 3.0]
	
	day_count = 1
	current_day = days[day_count - 1]
	customer_present = 0
	accepted_orders = 0
	fulfilled_orders = 0
	incomplete_orders = 0
	money_count = 0
	daily_rent = 30
	day_duration = 120.0

	pakal_smoked_days = 0
	coffee_in_bokal = 0
	pastis_in_bokal = 0
	beer_in_bokal = 0
	
	# upgrades
	max_drinks_ordered = 1
	client_spawn_delay = 10.0
	pourboire_enhancement = 1.0

func _next_day()-> void:
	if day_count == 7:
		call_ending()
	pakal_fed = false
	customer_present = 1
	accepted_orders = 0
	fulfilled_orders = 0
	incomplete_orders = 0
	max_drinks_ordered += max_drinks_ordered_supp[day_count - 1]
	client_spawn_delay -= client_spawn_delay_supp[day_count - 1]
	client_patience -= 3.5
	day_count += 1
	current_day = days[day_count - 1]

func call_ending():
	pass
