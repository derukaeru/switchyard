class_name RailLabel extends Label

func _init() -> void:
	var new_settings: LabelSettings = LabelSettings.new()
	
	new_settings.font_size = 48
	label_settings = new_settings
