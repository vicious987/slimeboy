extends AirState

export var jump_force:float = 3000
var final_jump_force = jump_force + max_gravity_speed
export var horizontal_maneuverability:float = 600
export(float,0,1) var acc_factor = 0.2

func enter(host):
	.enter(host)
	player_body.motion.y = -final_jump_force
	
func handle_input(event: InputEvent) -> void:
	if event.is_action_released("jump"):
		player_body.motion.y = 0
	
func update(host:KinematicBody2D, delta):
	.update(host, delta)

	if player_body.motion.y > 0:
		emit_signal("done", "Fall")
	
	apply_gravity()
	#player_body.motion.x = input_direction * horizontal_maneuverability
	player_body.motion.x = lerp(player_body.motion.x, input_direction * horizontal_maneuverability, acc_factor)
	host.move_and_slide(player_body.motion, Vector2.UP)

func exit(host):
	pass
