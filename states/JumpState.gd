extends AirState

func enter():
	.enter()
	player_body.get_node("JumpSound").play()
	player_body.motion.y += jump_speed
	
func handle_input(event: InputEvent) -> void:
	.handle_input(event)
	
func update(delta):
	.update(delta)
	
	if player_body.motion.y > 0:
		emit_signal("done", "Fall")
	if surface_detector.is_under_ceiling():
		player_body.motion.y = 0

func exit():
	pass
