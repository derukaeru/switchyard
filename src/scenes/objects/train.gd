class_name Train extends PathFollow2D

@onready var cab: ColorRect = $cab
@onready var particles: GPUParticles2D = $GPUParticles2D

@export var color: Color = Color("586ccaff")
@export var speed: int = 100
@export var destination: int = 1

@export var arrow_spacing: float = 40.0
@export var arrow_size: float = 6.0
@export var looping: bool = false
@export var rotation_speed: float = 5.0

var last_position: Vector2

func _ready() -> void:
	cab.color = color
	loop = looping
	
	last_position = global_position

func _process(delta: float) -> void: 
	var rail: Rail = get_parent() as Rail
	var length: float = rail.curve.get_baked_length()
	var target: float = progress + speed * delta
	
	if target < length:
		progress = target
		return
	
	var next := rail.get_next_rail()
	if next == null:
		progress = length
		arrived()
		return
	
	reparent(next, false)
	progress = target - length

func arrived() -> void:
	if get_parent().id == destination:
		EventManager.train_correct.emit()
	else:
		EventManager.train_wrong.emit()
	
	particles.emitting = false
	set_process(false)
