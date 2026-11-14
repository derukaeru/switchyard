@tool
extends Node2D

func _ready() -> void:
	load_level(GameManager.level)

func load_level(level: int) -> void:
	var lvl_instance: Node2D = load(Registry.UID["level_%s" % level]).instantiate()
	add_child(lvl_instance)
