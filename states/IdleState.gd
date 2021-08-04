extends GroundState

func enter(host):
	.enter(host)

func handle_input(event:InputEvent):
	.handle_input(event)

func update(host:KinematicBody2D, delta):


	if get_input_direction():
		emit_signal("done", "Move")
	if not player_body.is_on_ground():
		emit_signal("done", "Fall")
	player_body.motion = Vector2(0,0)
	#apply_gravity()
	#host.move_and_slide(player_body.motion)
	#print(motion)

func exit(host):
	pass
