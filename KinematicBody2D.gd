extends KinematicBody2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
var mv_sp = 500
var motion = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#motion.x = mv_sp
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	$Label.text = str(motion)
	motion.x = lerp(motion.x, mv_sp, 0.03)
	move_and_slide(motion, Vector2.UP)
	print(motion)
	5.0
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
