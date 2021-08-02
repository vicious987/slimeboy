extends State

export var jump_force:int = 1800
var final_jump_force = jump_force + max_gravity_speed
export var horizontal_maneuverability:int = 800

func enter(host):
	motion.y = -final_jump_force
	
func update(host:KinematicBody2D, delta):
	var input_direction = get_input_direction()
	update_look_direction(input_direction)

	if host.is_on_floor() and motion.y >= 0:
		emit_signal("done", "idle")
	
	apply_gravity()
	motion.x = input_direction * horizontal_maneuverability
	host.move_and_slide(motion, Vector2.UP)
	print(motion)

func exit(host):
	pass
