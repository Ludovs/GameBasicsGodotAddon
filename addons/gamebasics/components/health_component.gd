extends Node
class_name HealthComponent

signal died
signal damaged

@export var max_health: float

@onready var current_health = max_health

func take_damage(attack_script: AttackScript):
	current_health -= attack_script.attack_damage
	damaged.emit()
	if current_health <= 0:
		died.emit()
