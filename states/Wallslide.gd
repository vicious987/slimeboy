extends State

#make it handle both sides
	
func enter(host:KinematicBody2D) -> void:
	motion.x = 0
	
func exit(host:KinematicBody2D) -> void:
	return
	
func handle_input(event:InputEvent) -> void:
	if Input.is_action_just_released("move_left"):
		emit_signal("done", "Fall")
	
func update(host:KinematicBody2D, delta) -> void:
	if  not host.get_node("SurfaceDetector").is_next_to_left_wall(): #fix surface det ref
		emit_signal("done", "Fall")

	if motion.y > 0:
		motion.y = motion.y * 0.5
	apply_gravity()
	host.move_and_slide(motion, Vector2.UP)
