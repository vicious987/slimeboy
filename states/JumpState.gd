extends AirState

func enter():
	.enter()
	player_body.motion.y += jump_speed
	
func handle_input(event: InputEvent) -> void:
	return
	
func update(delta):
	.update(delta)
	
	if player_body.motion.y > 0:
		emit_signal("done", "Fall")

func exit():
	pass
