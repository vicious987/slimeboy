extends Node2D

onready var path = $Path2D
onready var path_follow = $Path2D/PathFollow2D
onready var path_len = $Path2D.curve.get_baked_length()

export var unit_speed = 0.01
export(bool) var cycle = true
export(bool) var percent_speed = true
export(float) var speed = 0.01

func move_percent():
	path_follow.unit_offset += unit_speed
	if path_follow.unit_offset == 1 or path_follow.unit_offset == 0:
		unit_speed = -unit_speed

func move_const():
	path_follow.offset += speed
	if path_follow.offset >= path_len or path_follow.offset <= 0:
		speed = -speed

func _physics_process(delta: float) -> void:
	if percent_speed:
		move_percent()
	else:
		move_const()
	

	
