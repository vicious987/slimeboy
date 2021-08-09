extends State

var move_to_wall:String
export var wallslide_speed = 150
	
func enter() -> void:
	match get_wall_direction():
		-1:
			move_to_wall = "move_left"
		1:
			move_to_wall = "move_right"
		_:
			push_error("wall direction different than 1 and -1")
	
func exit() -> void:
	player_body.motion.x = 0
	
func handle_input(event:InputEvent) -> void:
	if Input.is_action_just_released(move_to_wall):
		emit_signal("done", "Fall")
	if Input.is_action_just_pressed("jump"):
		emit_signal("done", "Walljump")
	
func update(delta) -> void:
	if not surface_detector.is_next_to_wall():
		emit_signal("done", "Fall")
	
	player_body.motion.y = lerp(player_body.motion.y, wallslide_speed, 0.3) #

	#squash&stretch
	sprite.scale.x = lerp(sprite.scale.x, 0.5, 1 - pow(0.01, delta))
	sprite.scale.y = lerp(sprite.scale.y, 2, 1 - pow(0.01, delta))
