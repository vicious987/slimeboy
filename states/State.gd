extends Node
class_name State

#An Interface defining what state class should provide
#signal for state transition
signal done(next_state_name)

func enter(host:KinematicBody2D) -> void:
	return
func exit(host:KinematicBody2D) -> void:
	return
func handle_input(event:InputEvent) -> void:
	return
func update(host:KinematicBody2D, delta) -> void:
	return

#Helper stuff
var motion = Vector2()
export var max_gravity_speed:int = 600
export var gravity_speed:int = 200
	
func apply_gravity() -> void:
	if motion.y < max_gravity_speed:
		motion.y = min(motion.y + gravity_speed, max_gravity_speed)

func get_input_direction() -> int:
	return int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
func update_look_direction(dir) -> void:
	if dir != 0:
		owner.look_direction = dir
