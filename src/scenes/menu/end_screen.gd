extends Control

@onready var animation: AnimationPlayer = $AnimationPlayer

@onready var level_label: Label = $level

func open() -> void:
	level_label.text = "Level %s" % str(GameManager.level)
	
	animation.play("open")
	show()

func _on_exit_pressed() -> void:
	animation.play_backwards("open")
	await animation.animation_finished
	hide()


func _on_restart_pressed() -> void:
	pass # Replace with function body.


func _on_continue_pressed() -> void:
	pass # Replace with function body.


func _on_menu_pressed() -> void:
	pass # Replace with function body.
