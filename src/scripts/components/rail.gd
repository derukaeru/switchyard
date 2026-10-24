@tool
class_name Rail extends Path2D

@export var end_junction: Junction

@onready var line: Line2D = Line2D.new()
@export var rail_color: Color = Color(0.345, 0.423, 0.793, 1.0)

@export var id: int = 1

func _ready() -> void:
	add_child(line)
	move_child(line, 0)
	
	line.points = curve.get_baked_points()
	line.width = 12
	line.default_color = rail_color

func get_next_rail() -> Rail:
	if end_junction == null:
		return null
	return end_junction.get_active_rail()
