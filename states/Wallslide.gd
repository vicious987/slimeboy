extends State

#make it handle both sides
	
func enter(host:KinematicBody2D) -> void:
	player_body.motion.x = 0
	
func exit(host:KinematicBody2D) -> void:
	return
	
func handle_input(event:InputEvent) -> void:
	if Input.is_action_just_released("move_left"):
		emit_signal("done", "Fall")
	if Input.is_action_just_pressed("jump"):
		emit_signal("done", "Walljump")
		#motion = Vector2(600,-1800)
		#owner.get_node("KinematicBody2D").move_and_slide(motion, Vector2.UP)
	
func update(host:KinematicBody2D, delta) -> void:
	if  not host.get_node("SurfaceDetector").is_next_to_left_wall(): #fix surface det ref
		emit_signal("done", "Fall")

	if player_body.motion.y > 0:
		player_body.motion.y = player_body.motion.y * 0.5
	apply_gravity()
	host.move_and_slide(player_body.motion, Vector2.UP)
