class_name Junction extends Node2D

signal switched(rail_index: int)

@export var rails: Array[Rail] = []
@export var rail_index: int = 0

func switch_track() -> void:
	if rails.size() < 2:
		return
	rail_index = (rail_index + 1) % rails.size()
	switched.emit(rail_index)
	
func get_active_rail() -> Path2D:
	return rails[rail_index] if not rails.is_empty() else null
