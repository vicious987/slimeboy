extends GroundState

export var move_speed = 800
export(float,0,1) var acc_factor = 0.2

func enter():
	.enter()

func handle_input(event:InputEvent):
	.handle_input(event)
		
func update(delta):
	var input_direction = get_input_direction()
	update_sprite_direction(input_direction)
		
	if input_direction:
		player_body.motion.x = lerp(player_body.motion.x, input_direction * move_speed, acc_factor)
	else:
		player_body.motion.x = lerp(player_body.motion.x, 0, 0.15)
		if abs(player_body.motion.x) < 32:
			emit_signal("done", "Idle")
			
	if not surface_detector.is_grounded():
		player_body.start_coyote_timer()
		emit_signal("done", "Fall")
	
	#squash&stretch
	sprite.scale.x = range_lerp(abs(player_body.motion.x), 0, move_speed, 1, 1.5)
	sprite.scale.y = range_lerp(abs(player_body.motion.x), 0, move_speed, 1, 0.9)

func exit():
	pass
