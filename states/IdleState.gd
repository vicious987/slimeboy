extends GroundState

func enter(host):
	.enter(host)

func exit(host):
	pass

func handle_input(event:InputEvent):
	.handle_input(event)
	if get_input_direction():
		emit_signal("done", "Move")

func update(host:KinematicBody2D, delta):
	if not player_body.is_on_ground():
		emit_signal("done", "Fall")
	player_body.motion = Vector2(0,0)


