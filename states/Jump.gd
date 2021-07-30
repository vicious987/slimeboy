extends "./State.gd"


func enter(host):
	var d = get_input_direction()
	update_look_direction(d)
	motion.y -= 1000
	
func update(host:KinematicBody2D, delta):
	if motion.y < 500:
		motion.y += 50
	if host.is_on_floor() and motion.y >= 0:
		emit_signal("done", "idle")
	host.move_and_slide(motion, Vector2.UP)
	print(motion)

func exit(host):
	motion.y = 0
