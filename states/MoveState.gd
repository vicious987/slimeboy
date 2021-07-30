extends "./State.gd"

export var MOVE_SPEED = 500

		
func update(host, delta):
	var input_direction = get_input_direction()
	update_look_direction(input_direction)
	if not input_direction:
		emit_signal("done", "idle")
	motion.x = input_direction * MOVE_SPEED
	motion = host.move_and_slide(motion, Vector2.UP)
	print(motion)
