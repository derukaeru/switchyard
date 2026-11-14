extends Control

@onready var settings_screen: Control = $settings_screen
@onready var level_screen: Control = $level_screen


func _on_start_pressed() -> void:
	level_screen.open()

func _on_settings_pressed() -> void:
	settings_screen.show()

func _on_exit_pressed() -> void:
	get_tree().quit()
