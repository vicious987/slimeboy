extends GroundState

export var move_speed = 1500
export(float,0,1) var acc_factor = 0.2

func handle_input(event:InputEvent):
	.handle_input(event)
		
func update(host, delta):
	var input_direction = get_input_direction()
	update_look_direction(input_direction)
		
	if input_direction:
		player_body.motion.x = lerp(player_body.motion.x, input_direction * move_speed, acc_factor)
	else:
		player_body.motion.x = lerp(player_body.motion.x, 0, 0.15)
		if abs(player_body.motion.x) < 32:
			player_body.motion.x = 0 
			emit_signal("done", "Idle")
	if not player_body.is_on_ground():
		emit_signal("done", "Fall")
	
	host.move_and_slide(player_body.motion, Vector2.UP)
	#print(motion)

func exit(host):
	pass
