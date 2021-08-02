extends KinematicBody2D

var mv_sp = 500
var motion = Vector2()

func _ready() -> void:
	#motion.x = mv_sp
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	$Label.text = str(motion)
	motion.x = lerp(motion.x, mv_sp, 0.03)
	move_and_slide(motion, Vector2.UP)
	print(motion)
