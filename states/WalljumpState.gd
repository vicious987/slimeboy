extends AirState

export var control_point_speed = -1000
func enter() -> void:
	player_body.get_node("JumpSound").play()
	player_body.motion.x = horizontal_maneuverability * -get_wall_direction()
	player_body.motion.y += jump_speed

func exit() -> void:
	return
	
func handle_input(event:InputEvent) -> void:
	.handle_input(event)
	return
	
func update(delta) -> void:
	player_body.motion.y += gravity_per_sec * delta
	if player_body.motion.y > control_point_speed:
		emit_signal("done","Fall")
	if surface_detector.is_under_ceiling():
		player_body.motion.y = 0
