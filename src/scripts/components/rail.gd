@tool
class_name Rail extends Path2D

@export var end_junction: Junction
@export var active: bool = true

@export var design_rail: bool = false

@export var arrow_spacing: float = 120.0
@export var arrow_size: float = 6.0

@onready var line: Line2D = Line2D.new()
@export var color: Color = Color("586ccaff")

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
	
	var length: float = curve.get_baked_length()

	for distance in range(48, int(length), 64):
		var point: Vector2 = curve.sample_baked(distance)
		var prev_point: Vector2 = curve.sample_baked(distance - 2.0)
		
		var dir: Vector2 = prev_point.direction_to(point)
		var left_wing: Vector2 = point + dir.rotated(2.5) * head_size
		var right_wing: Vector2 = point + dir.rotated(-2.5) * head_size
		
		draw_line(point, left_wing, color, 6)
		draw_line(point, right_wing, color, 6)

func _process(_delta: float) -> void:
	queue_redraw()
