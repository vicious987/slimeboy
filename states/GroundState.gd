extends State
class_name GroundState

func enter():
	owner.double_jump = false

func exit():
	pass

func handle_input(event:InputEvent) -> void:
	.handle_input(event)
	if event.is_action_pressed("jump"):
		emit_signal("done", "Jump")
