extends Timer
#@export var working_hours_per_day: int = 7
#@export var starting_hour: int = 15
#@export var seconds_per_hours: int = 30.0

@onready var timer: Timer = $Level/timer_day

var starting_money: float = 0.0

var time_in_hours: float = 0.0
var total_day_length: float = 0.0

func _ready():
	total_day_length = working_hours_per_day
	time_in_hours = fmod(starting_hour, total_day_length)
	
func _process(delta: float) -> void:
	time_in_hours += delta / seconds_per_hours
	time_in_hours = fmod(time_in_hours, total_day_length)
