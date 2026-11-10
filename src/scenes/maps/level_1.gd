extends Node2D

@export var train_amount: int = 2
var trains: Array = [] # if they get to the right destination

func _ready() -> void:
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
		# calculate amount of incorrects
		pass
	else:
		# correct
		pass
