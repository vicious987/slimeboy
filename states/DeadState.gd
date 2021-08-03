extends State

func enter(host:KinematicBody2D) -> void:
	print("press R to restart")
	
func exit(host:KinematicBody2D) -> void:
	owner.reset_coins()
	
func handle_input(event:InputEvent) -> void:
	if event.is_action_pressed("respawn"):
		owner.spawn()
		emit_signal("done", "Idle")
		
func update(host:KinematicBody2D, delta) -> void:
	return
