extends GroundState

export var move_speed = 1500
export(float,0,1) var acc_factor = 0.2

func handle_input(event:InputEvent):
	.handle_input(event)
		
func update(host, delta):
	var input_direction = get_input_direction()
	update_look_direction(input_direction)
	
	apply_gravity()
	if input_direction:
		motion.x = lerp(motion.x, input_direction * move_speed, acc_factor)
	else:
		motion.x = lerp(motion.x, 0, 0.15)
		if abs(motion.x) < 32:
			motion.x = 0 
			emit_signal("done", "Idle")
	
	host.move_and_slide(motion, Vector2.UP)
	#print(motion)

func exit(host):
	pass
