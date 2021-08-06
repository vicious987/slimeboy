extends AirState

func enter(host:KinematicBody2D) -> void:
	pass
	
func exit(host:KinematicBody2D) -> void:
	player_body.motion.y = 0
	
func handle_input(event:InputEvent) -> void:
	if event.is_action_pressed("jump") and owner.double_jump:
		owner.double_jump = false
		emit_signal("done", "Jump")

func update(host:KinematicBody2D, delta) -> void:
	.update(host, delta)
	
	if player_body.is_on_ground():
		if input_direction:
			emit_signal("done", "Move")
		else:
			emit_signal("done", "Idle")
	
	host.move_and_slide(player_body.motion, Vector2.UP)

