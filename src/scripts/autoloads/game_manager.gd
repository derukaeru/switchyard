extends Node

var level: int = 1
var locked_levels: Array = [false, true, true, true, true, true]

@onready var end_screen: Control = load(Registry.UID["end_screen"]).instantiate()

func _ready() -> void:
	add_child(end_screen)
	end_screen.hide()

func end_game() -> void:
	end_screen.show()
