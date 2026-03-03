class_name Constants extends RefCounted


enum Order {
	BROWN,
	BLONDE,
	RED,
	COFFEE,
	PASTIS,
}

enum Elements {
	MONDAY,
	TUESDAY,
	WEDNESDAY,
	THURSDAY,
	FRIDAY,
	SATURDAY,
	SUNDAY,
}

#day passes
var current_day = Elements.MONDAY

func _next_day()-> void:
	current_day = Elements.values()[(Elements.values().find(current_day) + 1) % Elements.values().size()]

#cota goes up when day passes
var current_day_client_quota: int = 10


#if clients are happy or not / if they pay
var happy_client: bool = false
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
	
