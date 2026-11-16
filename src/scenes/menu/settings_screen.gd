extends Control

@onready var animation: AnimationPlayer = $AnimationPlayer

func open() -> void:
	show()
	animation.play("open")

func _on_exit_pressed() -> void:
	animation.play_backwards("open")
	await animation.animation_finished
	hide()
