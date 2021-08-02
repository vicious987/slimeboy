extends GroundState

func enter(host:KinematicBody2D) -> void:
	return
	
func exit(host:KinematicBody2D) -> void:
	return
	
func handle_input(event:InputEvent) -> void:
	#pass
	#.handle_input(event)
	if Input.is_action_just_released("move_left"):
		emit_signal("done", "Idle")
	if event.is_action_pressed("jump"):
		motion.x = 1000
		motion.y = -3000
	
func update(host:KinematicBody2D, delta) -> void:
	apply_gravity()

	if motion.y > 0:
		motion.y = motion.y * 0.5
	host.move_and_slide(motion, Vector2.UP)
