extends CanvasLayer

@onready var animation: AnimationPlayer = $container/AnimationPlayer

@onready var level_label: Label = $container/level

func open() -> void:
	level_label.text = "Level %s" % str(GameManager.level + 1)
	
	animation.play("open")
	await get_tree().process_frame
	show()

func _on_exit_pressed() -> void:
	animation.play_backwards("open")
	await animation.animation_finished
	hide()

func _on_restart_pressed() -> void:
	SceneChanger.change_scene("main")
	await SceneChanger.loading_finished
	hide()
	animation.play_backwards("open")

func _on_continue_pressed() -> void:
	GameManager.level += 1
	SceneChanger.change_scene("main")
	await SceneChanger.loading_finished
	hide()
	animation.play_backwards("open")

func _on_menu_pressed() -> void:
	SceneChanger.change_scene("title_screen")
	await SceneChanger.loading_finished
	hide()
	animation.play_backwards("open")
