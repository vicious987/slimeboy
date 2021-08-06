extends State

var move_to_wall:String
	
func enter(host:KinematicBody2D) -> void:
	match get_wall_direction():
		-1:
			move_to_wall = "move_left"
		1:
			move_to_wall = "move_right"
		_:
			push_error("something fucky in wallslide")
	
func exit(host:KinematicBody2D) -> void:
	player_body.motion.x = 0
	
func handle_input(event:InputEvent) -> void:
	if Input.is_action_just_released(move_to_wall):
		emit_signal("done", "Fall")
	if Input.is_action_just_pressed("jump"):
		emit_signal("done", "Walljump")
	
func update(host:KinematicBody2D, delta) -> void:
	if  not host.get_node("SurfaceDetector").is_next_to_wall(): #fix surface det ref
		emit_signal("done", "Fall")

	if player_body.motion.y > 0:
		player_body.motion.y = player_body.motion.y * 0.5
	apply_gravity()
	host.move_and_slide(player_body.motion, Vector2.UP)
