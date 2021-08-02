extends State

export var horizontal_maneuverability:int = 600

func enter(host:KinematicBody2D) -> void:
	return
func exit(host:KinematicBody2D) -> void:
	return
func handle_input(event:InputEvent) -> void:
	return
func update(host:KinematicBody2D, delta) -> void:
	var input_direction = get_input_direction()
	update_look_direction(input_direction)
	
	if host.is_on_floor() and motion.y >= 0:
		if input_direction:
			emit_signal("done", "Move")
		else:
			emit_signal("done", "Idle")
	
	apply_gravity()
	motion.x = input_direction * horizontal_maneuverability
	host.move_and_slide(motion, Vector2.UP)
