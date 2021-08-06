extends State

var move_to_wall:String
export var wallslide_speed = 150
	
func enter(host:KinematicBody2D) -> void:
	match get_wall_direction():
		-1:
			move_to_wall = "move_left"
		1:
			move_to_wall = "move_right"
		_:
			push_error("wall direction different than 1 and -1")
	
func exit(host:KinematicBody2D) -> void:
	player_body.motion.x = 0
	
func handle_input(event:InputEvent) -> void:
	if Input.is_action_just_released(move_to_wall):
		emit_signal("done", "Fall")
	if Input.is_action_just_pressed("jump"):
		emit_signal("done", "Walljump")
	
func update(host:KinematicBody2D, delta) -> void:
	if not surface_detector.is_next_to_wall():
		emit_signal("done", "Fall")
	
	player_body.motion.y = lerp(player_body.motion.y, wallslide_speed, 0.3) #
	
	host.move_and_slide(player_body.motion, Vector2.UP)
