extends AirState

func enter(host):
	.enter(host)
	player_body.motion.y += jump_speed
	
func handle_input(event: InputEvent) -> void:
	return
	
func update(host:KinematicBody2D, delta):
	.update(host, delta)
	
	if player_body.motion.y > 0:
		emit_signal("done", "Fall")
		
	host.move_and_slide(player_body.motion, Vector2.UP)

func exit(host):
	pass
