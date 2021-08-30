extends KinematicBody2D
var motion
onready var bounding_pos = get_parent().get_node("BoundingPosition")
var dir = 1

func get_bounding_position_distance() -> float:
	return abs(position.x - bounding_pos.position.x)

func move_randomly(bounding_length):
	motion.x = 200 * dir
	if get_bounding_position_distance() > bounding_length:
		dir *= -1

func _physics_process(delta: float) -> void:
	motion = Vector2(0,200)
	move_randomly(300)
	move_and_slide(motion, Vector2.UP)
