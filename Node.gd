extends Node2D

var rc_ground_left:RayCast2D
var rc_ground_right:RayCast2D
var rc_wall_l_upper:RayCast2D
var rc_wall_l_lower:RayCast2D
var rc_wall_r_upper:RayCast2D
var rc_wall_r_lower :RayCast2D

func _ready() -> void:
	rc_ground_left = $RayCastGroundLeft
	rc_ground_right = $RayCastGroundRight
	rc_wall_l_upper = $RayCastLWallUpper
	rc_wall_l_lower = $RayCastLWallLower
	rc_wall_r_upper = $RayCastRWallUpper
	rc_wall_r_lower = $RayCastRWallLower

func is_grounded() -> bool:
	return rc_ground_left.is_colliding() or rc_ground_right.is_colliding()
	#return $RayCastGroundRight.is_colliding()

func is_next_to_wall() -> bool:
	return is_next_to_left_wall() or is_next_to_right_wall()

func is_next_to_left_wall() -> bool:
	return rc_wall_l_upper.is_colliding() or rc_wall_l_lower.is_colliding()

func is_next_to_right_wall() -> bool:
	return rc_wall_r_upper.is_colliding() or rc_wall_r_lower.is_colliding()
