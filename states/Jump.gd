extends AirState

export var jump_force:int = 1800
var final_jump_force = jump_force + max_gravity_speed
export var horizontal_maneuverability:int = 600

func enter(host):
	.enter(host)
	motion.y = -final_jump_force
	
func handle_input(event: InputEvent) -> void:
	if event.is_action_released("jump"):
		motion.y = 0
	
func update(host:KinematicBody2D, delta):
	.update(host, delta)
	if motion.y > 0:
		emit_signal("done", "Fall")
	
	apply_gravity()
	motion.x = input_direction * horizontal_maneuverability
	host.move_and_slide(motion, Vector2.UP)
	#print(motion)

func exit(host):
	pass
