extends State

export var horizontal_maneuverability:int = 600

func enter(host:KinematicBody2D) -> void:
	pass
	
func exit(host:KinematicBody2D) -> void:
	pass
	
func handle_input(event:InputEvent) -> void:
	return												#! DISABLES DOUBLE JUMP
	#if event.is_action_pressed("jump") and false:# fixit
		#double_jump = false
		#emit_signal("done", "Jump")
# ^^^^^^^^^ its fucked somehow, doesnt inherit signal?????
func update(host:KinematicBody2D, delta) -> void:
	#.update(host, delta) vvvvv
	input_direction = get_input_direction()
	update_look_direction(input_direction)

	if input_direction == -1 and host.get_node("SurfaceDetector").is_next_to_left_wall(): #fix
		emit_signal("done", "Wallslide")
	# ^^^ its from airstate
	
	if host.is_on_floor() and player_body.motion.y >= 0:
		if input_direction:
			emit_signal("done", "Move")
		else:
			emit_signal("done", "Idle")
	
	apply_gravity()
	player_body.motion.x = input_direction * horizontal_maneuverability
	host.move_and_slide(player_body.motion, Vector2.UP)
