extends "./State.gd"

func handle_input(event:InputEvent):
	if event.is_action_pressed("jump"):
		emit_signal("done", "jump")

func update(host, delta):
	var input_direction = get_input_direction()
	if input_direction:
		emit_signal("done", "move")
	print(motion)

func enter(host):
	motion = Vector2.ZERO
