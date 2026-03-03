class_name Constants extends RefCounted

var Order_types: Array[String] = ["red", "brown", "blond", "coffee", "pastis"]
var days: Array[String] = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]


#enum Order {
	#BROWN,
	#BLONDE,
	#RED,
	#COFFEE,
	#PASTIS,
#}

#enum Elements {
	#MONDAY,
	#TUESDAY,
	#WEDNESDAY,
	#THURSDAY,
	#FRIDAY,
	#SATURDAY,
	#SUNDAY,
#}

#day passes
var happy_client: bool = false
var index: int = 0
var first_day: String = days[0]
var current_day: String = first_day

func _next_day()-> void:
	current_day = days[index +1]
	#current_day = Elements.values()[(Elements.values().find(current_day) + 1) % Elements.values().size()]
	
	

#cota goes up when day passes
var current_day_client_quota: int = 10


#if clients are happy or not / if they pay
var satisfaction: int = 0
var fish_coins: int = 0

func _satisfaction(value: int) -> void:
	satisfaction = value
	if satisfaction >= 1:
		happy_client = true
	else:
		happy_client = false


func _ready() -> void:
	fish_coins -= 10
	if happy_client:
		fish_coins += 10
	
