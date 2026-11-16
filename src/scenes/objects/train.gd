class_name Train extends PathFollow2D

@onready var cab: ColorRect = $cab
@onready var particles: GPUParticles2D = $GPUParticles2D

@onready var right_destination: GPUParticles2D = $right_destination
@onready var wrong_destination: GPUParticles2D = $wrong_destination

@onready var audio: AudioStreamPlayer2D = $AudioStreamPlayer2D

@export var color: Color = Color("586ccaff")
@export var speed: int = 100
@export var destination: int = 1

@export var arrow_spacing: float = 40.0
@export var arrow_size: float = 6.0
@export var looping: bool = false
@export var rotation_speed: float = 5.0

var arrived_at: bool = false

func _ready() -> void:
	cab.color = color
	loop = looping
	
	audio.play()

func _process(delta: float) -> void:
	particles.global_rotation = 0.0
	if arrived_at: return
	
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
	if get_parent().design_rail:
		progress = 0.0
		return
	
	if get_parent().id == destination:
		EventManager.train_correct.emit()
		right_destination.emitting = true
	else:
		EventManager.train_wrong.emit()
		wrong_destination.emitting = true
	
	arrived_at = true
	particles.emitting = false
	
	audio.stop()
	
	await particles.finished
	queue_free()
