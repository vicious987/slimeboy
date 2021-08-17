extends KinematicBody2D
var motion

func _physics_process(delta: float) -> void:
	motion = Vector2(0,200)
	move_and_slide(motion, Vector2.UP)
