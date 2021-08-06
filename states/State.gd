extends Node
class_name State

#An Interface defining what state class should provide

signal done(next_state_name) #signal for state transition

func enter(host:KinematicBody2D) -> void:
	return
func exit(host:KinematicBody2D) -> void:
	return
func handle_input(event:InputEvent) -> void:
	return
func update(host:KinematicBody2D, delta) -> void:
	return

#Helper stuff
#var motion = Vector2()
export var max_gravity_speed:int = 600
export var gravity_speed:int = 100
var input_direction:int
var jumps_left:int
var player_body:KinematicBody2D
	
func apply_gravity() -> void:
	player_body.motion.y = lerp(player_body.motion.y, max_gravity_speed, 0.075)

func get_input_direction() -> int:
	return int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
func update_look_direction(dir) -> void:
	if dir != 0:
		owner.look_direction = dir

func get_wall_direction() -> int:
	var surf_det = player_body.get_node("SurfaceDetector")
	return int(surf_det.is_next_to_right_wall()) - int(surf_det.is_next_to_left_wall())
