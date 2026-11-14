extends Control

@onready var levels: GridContainer = $levels

func open() -> void:
	show()
	
	var levels_child: Array[Node] = levels.get_children()
	for i in range(GameManager.locked_levels.size()):
		levels_child[i].disabled = GameManager.locked_levels[i]

func _on_exit_pressed() -> void:
	hide()

func pick_level(level: int) -> void:
	GameManager.level = level
	SceneChanger.change_scene("main")
