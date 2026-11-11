@tool
class_name Junction extends Node2D

signal switched(rail_index: int)
@onready var sprite: Sprite2D = Sprite2D.new()

@export var color: Color = Color("586ccaff")

@export var rails: Array[Rail] = []
@export var rail_index: int = 0

func _ready() -> void:
	for rail in rails:
		rail.active = false
	
	rails[rail_index].active = true
	sprite.texture = load("res://src/assets/sprites/objects/junction.png")
	add_child(sprite)

func switch_track() -> void:
	if rails.size() < 2:
		return
		
	rail_index = (rail_index + 1) % rails.size()
	
	for rail in rails:
		rail.active = false
	rails[rail_index].active = true
	
	switched.emit(rail_index)
	
func get_active_rail() -> Path2D:
	return rails[rail_index] if not rails.is_empty() else null
