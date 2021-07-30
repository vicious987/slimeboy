extends Node2D

var look_direction:int = 1
#onready var player_motion = $KinematicBody2D2.current_state.qwe
onready var STATE_MACHINE = $KinematicBody2D2
onready var DEBUG_LABEL = $KinematicBody2D2/Label

func _ready():
	pass

func _physics_process(delta):
	DEBUG_LABEL.text =  "state: " + str(STATE_MACHINE.current_state.name) + "\n"
	DEBUG_LABEL.text += "look dir: " + str(look_direction) + "\n"
	#DEBUG_LABEL.text += "motion: " + str(player_motion) + "\n"
	pass
