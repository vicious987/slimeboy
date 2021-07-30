extends State
class_name GroundState

func handle_input(event:InputEvent) -> void:
	if event.is_action_pressed("jump"):
		emit_signal("done", "jump")
