class_name Train extends PathFollow2D

@onready var cab: ColorRect = $cab

@export var train_color: Color = Color("6f98dc")
@export var speed: int = 160

@export var destination: int = 1

func _ready() -> void:
	cab.color = train_color

func _process(delta: float) -> void: 
	progress += delta * speed
	
	if progress_ratio >= 1.0:
		finish()

func finish() -> void:
	pass
