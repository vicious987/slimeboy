extends State

func enter() -> void:
	player_body.motion = Vector2()
	player_body.get_node("DeathSound").play()
	player_body.get_node("RestartReminderLabel").show()
	
func exit() -> void:
	pass
	
func handle_input(event:InputEvent) -> void:
	if event.is_action_pressed("reset"):
		owner.reset()
		emit_signal("done", "Idle")
		
func update(delta) -> void:
	return
