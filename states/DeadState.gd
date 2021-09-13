extends State

func enter() -> void:
	#player_body.get_node("CollisionShape2D").disabled = true
	player_body.set_collision_layer_bit(0, false) # why just disabling collisionshape doesnt work?
	player_body.get_node("DeathSound").play()
	player_body.get_node("RestartReminderLabel").show()
	sprite.hide()
	player_body.motion = Vector2()
	
func exit() -> void:
	#player_body.get_node("CollisionShape2D").disabled = false
	player_body.set_collision_layer_bit(0, true)
	player_body.get_node("RestartReminderLabel").hide()
	sprite.show()
	
func handle_input(event:InputEvent) -> void:
	if event.is_action_pressed("reset"):
		owner.reset()
		emit_signal("done", "Idle")
		
func update(delta) -> void:
	return
