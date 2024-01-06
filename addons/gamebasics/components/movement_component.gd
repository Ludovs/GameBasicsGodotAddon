extends Node
class_name MovementComponent

@export var move_speed = 50
@export var move_acceleration = 0.5
@export var sprite: Sprite2D

var velocity = Vector2.ZERO

func accelerate_to_closest_body(body_group: String, MAX_RANGE = 250):
	var bodies = get_tree().get_nodes_in_group(body_group)
	bodies = bodies.filter(func(body : Node2D): return body.global_position.distance_squared_to(owner.global_position) < pow(MAX_RANGE, 2))
	if bodies.size() == 0:
		decelerate()
		return
	
	bodies.sort_custom(func(a:Node2D, b:Node2D):
		var a_distance = a.global_position.distance_squared_to(owner.global_position)
		var b_distance = b.global_position.distance_squared_to(owner.global_position)
		return a_distance < b_distance
	)
	
	var move_direction = owner.global_position.direction_to(bodies.front().global_position)
	accelerate_in_direction(move_direction)
	if sprite: sprite.flip_h = true if velocity.x > 0 else false
	
func accelerate_in_direction(direction: Vector2):
	var desired_velocity = direction*move_speed
	velocity = velocity.lerp(desired_velocity, 1-exp(-move_acceleration*get_process_delta_time()))
	if sprite: sprite.flip_h = true if velocity.x > 0 else false

func add_velocity(vel: Vector2):
	velocity = vel

func decelerate():
	accelerate_in_direction(Vector2.ZERO)

func move(char_boy: CharacterBody2D):
	char_boy.velocity = velocity
	char_boy.move_and_slide()
