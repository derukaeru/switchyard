class_name Switch extends TextureButton
@export var junction: Junction

func _on_pressed() -> void:
	junction.switch_track() 
