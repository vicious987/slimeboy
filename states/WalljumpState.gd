extends AirState

export var control_point_speed = -1000
func enter(host:KinematicBody2D) -> void:
	player_body.motion.x = horizontal_maneuverability * -get_wall_direction()
	player_body.motion.y += jump_speed

func exit(host:KinematicBody2D) -> void:
	return
	
func handle_input(event:InputEvent) -> void:
	return
	
func update(host:KinematicBody2D, delta) -> void:
	player_body.motion.y += gravity_per_sec * delta
	if player_body.motion.y > control_point_speed:
		emit_signal("done","Fall")

	host.move_and_slide(player_body.motion, Vector2.UP)
