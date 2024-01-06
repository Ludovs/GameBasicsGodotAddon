
extends Area2D
class_name HurtBoxComponent

@export var health_component: HealthComponent

#You MUST change the collision mask as your liking for both the Hitbox and the Hurtbox components

func _on_area_entered(area):
	if area is HitBoxComponent:
		health_component.take_damage(area.attack_stats)
