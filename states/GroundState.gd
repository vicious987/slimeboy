extends State
class_name GroundState

func enter(host):
	owner.double_jump = true

func exit(host):
	pass

func handle_input(event:InputEvent) -> void:
	if event.is_action_pressed("jump"):
		emit_signal("done", "Jump")
