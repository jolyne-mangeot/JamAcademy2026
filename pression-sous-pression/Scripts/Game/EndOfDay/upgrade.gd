extends Control

@onready var pause: Control = $PauseMenu/PauseMenu
@onready var next_button: Button = $CanvasLayer/Next_day_button

@onready var time_button: Button = $CanvasLayer/VBoxContainer/Time_enhancement_tap
@onready var pourboire_button: Button = $CanvasLayer/VBoxContainer/Pourboire_enhancement
@onready var max_order_button: Button = $CanvasLayer/VBoxContainer/max_order_button
@onready var delay_button: Button = $CanvasLayer/VBoxContainer/delay_client_button

@export var Price_patience: int
@export var Price_max_order: int
@export var Price_delay: int
@export var Price_pourboire: int


func _ready() -> void:
	next_button.pressed.connect(_on_next_day_button_pressed)
	
	delay_button.pressed.connect(_on_delay_client_button_pressed)
	pourboire_button.pressed.connect(_on_pourboire_enhancement_pressed)
	time_button.pressed.connect(_on_time_enhancement_tap_pressed)
	max_order_button.pressed.connect(_on_max_order_button_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().paused = !get_tree().paused
		pause.visible = get_tree().paused


func _on_next_day_button_pressed() -> void:
	GameManager._next_day()
	get_tree().change_scene_to_file("res://Scenes/Game Scene.tscn")
	

func _on_time_enhancement_tap_pressed() -> void:
	if GameManager.money_count >= Price_patience:
		GameManager.money_count -= Price_patience
		GameManager.client_patience += 5
		print("It just works")
	else:
		print("YIPEEEEE")
		print(GameManager.client_patience)
		return


func _on_pourboire_enhancement_pressed() -> void:
	if GameManager.money_count >= Price_pourboire:
		GameManager.money_count -= Price_pourboire
		GameManager.pourboire_enhancement += 0.20
		print("YEAAAAH")
	else:
		print("Oh no")
		return
		


func _on_max_order_button_pressed() -> void:
	if GameManager.money_count >= Price_max_order:
		GameManager.money_count -= Price_max_order
		GameManager.max_drinks_ordered -= 1
		print("OH NOOOOOOO")
	else:
		print("WOOoooo")
		print(GameManager.max_drinks_ordered)
		return
	

func _on_delay_client_button_pressed() -> void:
	if GameManager.money_count >= Price_delay:
		GameManager.money_count -= Price_delay
		GameManager.client_spawn_delay += 2
		print("IT JUST WORKS")
	else:
		print("HIHIHIHI")
		return
