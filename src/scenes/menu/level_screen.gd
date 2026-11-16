extends Control

@onready var levels: GridContainer = $levels
@onready var animation: AnimationPlayer = $AnimationPlayer

func open() -> void:
	animation.play("open")
	show()
	
	var levels_child: Array[Node] = levels.get_children()
	for i in range(GameManager.locked_levels.size()):
		levels_child[i].disabled = GameManager.locked_levels[i]

func _on_exit_pressed() -> void:
	animation.play_backwards("open")
	await animation.animation_finished
	hide()

func pick_level(level: int) -> void:
	GameManager.level = level
	SceneChanger.change_scene("main")
