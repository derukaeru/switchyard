class_name Train extends PathFollow2D

@export var speed: int = 160

func _process(delta: float) -> void: 
	progress += delta * speed
