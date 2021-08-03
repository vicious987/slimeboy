extends Node2D

var look_direction:int = 1
var double_jump = true
var is_dead = false
var coins = 0
var motion = Vector2()
#onready var player_motion = $KinematicBody2D2.current_state.qwe
onready var STATE_MACHINE = $KinematicBody2D
onready var DEBUG_LABEL = $KinematicBody2D/Label
onready var GAME_STATE = $Gamestate

func _ready():
	spawn()
	
func reset_coins():
	coins = 0
	
func die():
	print("im die!")

func spawn():
	$KinematicBody2D.position = $Spawnpoint.position

func _physics_process(delta):
	DEBUG_LABEL.text =  "state: " + str(STATE_MACHINE.current_state.name) + "\n"
	DEBUG_LABEL.text += "look dir: " + str(look_direction) + "\n"
	#DEBUG_LABEL.text += "motion: " + str(player_motion) + "\n"
	DEBUG_LABEL.text += "is_grounded:" + str($KinematicBody2D/SurfaceDetector.is_grounded()) + "\n"
	DEBUG_LABEL.text += "is_dead:" + str(is_dead) + "\n"
	
	GAME_STATE.text = "coins: " + str(coins)
