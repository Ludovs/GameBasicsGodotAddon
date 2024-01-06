extends Node

@export var flash_material: ShaderMaterial
@export var flash_color: Color
@export var sprite: Sprite2D
@export var health_component: HealthComponent

func _ready():
	sprite.material = flash_material
	health_component.damaged.connect(flash)
	sprite.material.set_shader_parameter("tint", flash_color)

func flash():
	sprite.material.set_shader_parameter("active", true)
	await get_tree().create_timer(0.15).timeout
	sprite.material.set_shader_parameter("active", false)
