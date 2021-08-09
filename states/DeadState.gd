extends State

func enter() -> void:
	player_body.motion = Vector2()
	print("press R to restart")
	
func exit() -> void:
	owner.reset_coins()
	
func handle_input(event:InputEvent) -> void:
	if event.is_action_pressed("respawn"):
		owner.spawn()
		emit_signal("done", "Idle")
		
func update(delta) -> void:
	return
