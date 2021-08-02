extends GroundState

func handle_input(event:InputEvent):
	.handle_input(event)

func update(host:KinematicBody2D, delta):
	if get_input_direction():
		emit_signal("done", "Move")
		
	apply_gravity()
	host.move_and_slide(motion)
	#print(motion)

func enter(host):
	pass

func exit(host):
	pass
