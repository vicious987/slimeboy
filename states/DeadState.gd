extends State

func enter() -> void:
	player_body.motion = Vector2()
	print("press R to Reset")
	
func exit() -> void:
	pass
	
func handle_input(event:InputEvent) -> void:
	if event.is_action_pressed("reset"):
		owner.reset()
		emit_signal("done", "Idle")
		
func update(delta) -> void:
	return
