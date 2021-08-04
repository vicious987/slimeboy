extends State

var gravity
var jump_height = 500
var jump_speed
var jump_duration =0.7

func _ready() -> void:
	gravity = 2 * jump_height / pow(jump_duration, 2)
	jump_speed = -sqrt(2 * gravity * jump_height)

var controllable
func enter(host:KinematicBody2D) -> void:
	player_body.motion.x = 600
	player_body.motion.y += jump_speed
	#controllable = false
func exit(host:KinematicBody2D) -> void:
	return
	
func handle_input(event:InputEvent) -> void:
	return
	
func update(host:KinematicBody2D, delta) -> void:
	player_body.motion.y += gravity * delta
	if player_body.motion.y > -1000:
		emit_signal("done","Fall")

	host.move_and_slide(player_body.motion, Vector2.UP)
