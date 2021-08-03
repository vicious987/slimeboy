extends AirState

export var horizontal_maneuverability:int = 600

func enter(host:KinematicBody2D) -> void:
	pass
	
func exit(host:KinematicBody2D) -> void:
	pass
	
func handle_input(event:InputEvent) -> void:
	if event.is_action_pressed("jump") and owner.double_jump:
		owner.double_jump = false
		emit_signal("done", "Jump")

func update(host:KinematicBody2D, delta) -> void:
	.update(host, delta)
	
	if host.is_on_floor() and player_body.motion.y >= 0:
		if input_direction:
			emit_signal("done", "Move")
		else:
			emit_signal("done", "Idle")
	
	apply_gravity()
	player_body.motion.x = input_direction * horizontal_maneuverability
	host.move_and_slide(player_body.motion, Vector2.UP)
