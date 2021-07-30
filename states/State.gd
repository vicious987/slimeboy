extends Node
class_name State

var qwe = "???"
var motion = Vector2() setget set_motion, get_motion
var GRAVITY_SPEED = 100
var MAX_GRAVITY_SPEED = 200
#signal for state transition
signal done(next_state_name)

func set_motion(v:Vector2):
	motion = v
	
func get_motion():
	return motion
	
func apply_gravity():
	if motion.y < MAX_GRAVITY_SPEED:
		motion.y += GRAVITY_SPEED
	
func get_input_direction() -> int:
	return int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
func update_look_direction(dir) -> void:
	if dir != 0:
		owner.look_direction = dir
	
func enter(host):
	return

func exit(host):
	return

func handle_input(event):
	return

func update(host, delta):
	return
