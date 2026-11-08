@tool
class_name Rail extends Path2D

@export var end_junction: Junction
@export var active: bool = true

@export var arrow_spacing: float = 120.0
@export var arrow_size: float = 6.0

@onready var line: Line2D = Line2D.new()
@export var color: Color = Color(0.345, 0.423, 0.793, 1.0)

@export var id: int = 1
var head_size: int = 32

func _ready() -> void:
	add_child(line)
	move_child(line, 0)
	
	line.show_behind_parent = true
	line.points = curve.get_baked_points()
	line.width = 12
	line.default_color = color

func get_next_rail() -> Rail:
	if end_junction == null:
		return null
	return end_junction.get_active_rail()

func _draw() -> void:
	if not active or end_junction: return
	
	var points: PackedVector2Array = curve.get_baked_points()
	@warning_ignore("integer_division")
	for i in int(points.size() / 16) - 1:
		var pos: int = ((i + 1) * 16)
		var prev_pos: int = max(0, ((i + 1) * 16))
		
		if pos < points.size():
			
			var point: Vector2 = points[pos]
			var prev_point: Vector2 = points[prev_pos]
			
			var dir: Vector2 = prev_point.direction_to(point)
			var left_wing = point + dir.rotated(2.5) * head_size
			var right_wing = point + dir.rotated(-2.5) * head_size
			
			var triangle_points = PackedVector2Array([point, left_wing, right_wing])
			draw_polygon(triangle_points, PackedColorArray([Color()]))
			
func _process(_delta: float) -> void:
	queue_redraw()
