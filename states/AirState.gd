extends State
class_name AirState

export var jumps:int = 1
#var jumps_left:int
var gravity
var jump_height = 400
var jump_speed
var jump_duration = 0.4

func enter(host:KinematicBody2D) -> void:
	pass
	
func exit(host:KinematicBody2D) -> void:
	pass
	
func handle_input(event:InputEvent) -> void:
	return
	
func update(host:KinematicBody2D, delta) -> void:
	input_direction = get_input_direction()
	update_look_direction(input_direction)

	if input_direction and host.get_node("SurfaceDetector").is_next_to_wall(): #fix
		emit_signal("done", "Wallslide")
