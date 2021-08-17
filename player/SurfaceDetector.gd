extends Node2D

export(int) var jump_buffer = 10
onready var rc_ground_left:RayCast2D = $RayCastGroundLeft
onready var rc_ground_right:RayCast2D = $RayCastGroundRight
onready var rc_wall_l_upper:RayCast2D = $RayCastLWallUpper
onready var rc_wall_l_lower:RayCast2D = $RayCastLWallLower
onready var rc_wall_r_upper:RayCast2D = $RayCastRWallUpper
onready var rc_wall_r_lower :RayCast2D = $RayCastRWallLower
onready var rc_jump_buffer_left:RayCast2D = $RayCastJumpBufferLeft
onready var rc_jump_buffer_right:RayCast2D = $RayCastJumpBufferRight
onready var rc_ceiling_left:RayCast2D = $RayCastCeilingLeft
onready var rc_ceiling_right:RayCast2D = $RayCastCeilingRight

func _ready() -> void:
	rc_jump_buffer_left.set_cast_to(Vector2(0, jump_buffer))
	rc_jump_buffer_right.set_cast_to(Vector2(0, jump_buffer))

func is_within_jumpbuffer() -> bool:
	return rc_jump_buffer_left.is_colliding() or rc_jump_buffer_right.is_colliding()

func is_grounded() -> bool:
	return rc_ground_left.is_colliding() or rc_ground_right.is_colliding()

func is_under_ceiling() -> bool:
	return rc_ceiling_left.is_colliding() or rc_ceiling_right.is_colliding()

func is_next_to_wall() -> bool:
	return is_next_to_left_wall() or is_next_to_right_wall()

func is_next_to_left_wall() -> bool:
	return rc_wall_l_upper.is_colliding() or rc_wall_l_lower.is_colliding()

func is_next_to_right_wall() -> bool:
	return rc_wall_r_upper.is_colliding() or rc_wall_r_lower.is_colliding()
