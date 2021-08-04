extends AirState

export var horizontal_maneuverability:int = 600
export(float,0,1) var acc_factor = 0.2

func _ready() -> void:
	gravity = 2 * jump_height / pow(jump_duration, 2)
	jump_speed = -sqrt(2 * gravity * jump_height)


func enter(host:KinematicBody2D) -> void:
	pass
	
func exit(host:KinematicBody2D) -> void:
	player_body.motion.y = 0
	
func handle_input(event:InputEvent) -> void:
	if event.is_action_pressed("jump") and owner.double_jump:
		owner.double_jump = false
		emit_signal("done", "Jump")

func update(host:KinematicBody2D, delta) -> void:
	.update(host, delta)
	
	if player_body.is_on_ground():# and player_body.motion.y >= 0:
		if input_direction:
			emit_signal("done", "Move")
		else:
			emit_signal("done", "Idle")
	
	player_body.motion.y += gravity * delta
	player_body.motion.x = lerp(player_body.motion.x, input_direction * horizontal_maneuverability, acc_factor)
	host.move_and_slide(player_body.motion, Vector2.UP)

