extends State

var controllable
func enter(host:KinematicBody2D) -> void:
	player_body.motion = Vector2(2000,-3000)
	#controllable = false
func exit(host:KinematicBody2D) -> void:
	return
	
func handle_input(event:InputEvent) -> void:
	return
	
func update(host:KinematicBody2D, delta) -> void:
	apply_gravity()
	if player_body.motion.y > 0:
		emit_signal("done","Fall")

	host.move_and_slide(player_body.motion, Vector2.UP)
