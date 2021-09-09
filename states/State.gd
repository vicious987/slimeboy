extends Node
class_name State

#An Interface defining what state class should provide

signal done(next_state_name) #signal for state transition

func enter() -> void:
	return
func exit() -> void:
	return
	
func handle_input(event:InputEvent) -> void:
	if Input.is_action_just_pressed("reset"):
		if dt_timer.time_left == 0:
			dt_timer.start()
		else:
			player_body.die()

		
func update(delta) -> void:
	return

#Helper stuff
var input_direction:int
var jumps_left:int

#onready var player_body:KinematicBody2D = owner.get_node("KinematicBody2D")
onready var player_body:KinematicBody2D = get_parent().get_parent()
onready var surface_detector = player_body.get_node("SurfaceDetector")
onready var sprite = player_body.get_node("Sprite")
onready var dt_timer:Timer = player_body.get_node("DoubleTapTimer")

func get_input_direction() -> int:
	return int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
func update_look_direction(dir) -> void:
	if dir != 0:
		owner.look_direction = dir

func update_sprite_direction(dir) -> void:
	match dir:
		1:
			sprite.flip_h = false
		-1:
			sprite.flip_h = true

func get_wall_direction() -> int:
	return int(surface_detector.is_next_to_right_wall()) - int(surface_detector.is_next_to_left_wall())
