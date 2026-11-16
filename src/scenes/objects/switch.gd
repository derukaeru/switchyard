class_name Switch extends TextureButton
@export var junction: Junction

@onready var audio: AudioStreamPlayer = $AudioStreamPlayer

var curr_texture: int = 1
var textures: Array[Texture2D] = [load(Registry.UID["switch"]), load(Registry.UID["switch_flipped"])]

func _on_pressed() -> void:
	junction.switch_track() 
	
	texture_normal = textures[curr_texture]
	curr_texture += 1
	curr_texture = curr_texture % 2
	
	audio.play()
