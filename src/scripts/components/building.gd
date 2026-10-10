class_name Building extends Node

var def: NodeDef
var cell: Vector2i

var hp: int 
var connected: bool = false

func setup(d: NodeDef, c: Vector2i) -> void:
	def = d
	cell = c
	hp = d.hp

func take_damage(amount: int) -> void:
	hp -= amount
	if hp <= 0:
		EventManager.building_destroyed.emit(self)

func network_tick() -> void:
	pass
