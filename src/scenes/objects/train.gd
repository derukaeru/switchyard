class_name Train extends PathFollow2D

@onready var cab: ColorRect = $cab

@export var train_color: Color = Color("6f98dc")
@export var speed: int = 160
@export var destination: int = 1

func _ready() -> void:
	cab.color = train_color
	loop = false

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
	set_process(false)
