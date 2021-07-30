extends GroundState

export var move_speed = 1500

func handle_input(event:InputEvent):
	.handle_input(event)
		
func update(host, delta):
	var input_direction = get_input_direction()
	update_look_direction(input_direction)
	if not input_direction:
		emit_signal("done", "idle")
	
	apply_gravity()
	motion.x = input_direction * move_speed
	
	host.move_and_slide(motion, Vector2.UP)
	print(motion)

func exit(host):
	motion.y = 0
