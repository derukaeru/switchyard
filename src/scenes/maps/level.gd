extends Node2D

@onready var tracks: Node2D = $tracks
var train_amount: int = 0
var trains: Array = [] # if they get to the right destination

func _ready() -> void:
	train_amount = tracks.find_children("*").filter(func(a): return a is Train).size()
	EventManager.train_correct.connect(train_correct)
	EventManager.train_wrong.connect(train_wrong)

func train_correct() -> void:
	trains.append(true)
	update_trains()

func train_wrong() -> void:
	trains.append(false)
	update_trains()

func update_trains() -> void:
	if not trains.size() >= train_amount: return
	
	if trains.has(false):
		pass
	else:
		GameManager.locked_levels[GameManager.level] = false
	
	await get_tree().create_timer(2.0).timeout
	GameManager.end_game()
