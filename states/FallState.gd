extends AirState

func enter() -> void:
	pass
	
func exit() -> void:
	player_body.motion.y = 0
	
func handle_input(event:InputEvent) -> void:
	if event.is_action_pressed("jump"):
		if surface_detector.is_within_jumpbuffer() or player_body.can_coyotejump:
			emit_signal("done", "Jump")
		elif (owner.double_jump):
			owner.double_jump = false
			emit_signal("done", "Jump")

func update(delta) -> void:
	.update(delta)
	
	if surface_detector.is_grounded():
		if input_direction:
			emit_signal("done", "Move")
		else:
			emit_signal("done", "Idle")


