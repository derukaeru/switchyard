@tool
class_name Rail extends Path2D

@onready var line: Line2D = Line2D.new()
@export var rail_color: Color = Color(0.345, 0.423, 0.793, 1.0)
func _ready() -> void:
	add_child(line)
	
	line.points = curve.get_baked_points()
	line.width = 12
	line.default_color = rail_color
