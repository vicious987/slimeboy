extends KinematicBody2D

var motion = Vector2()

func collect_coin():
	get_parent().inc_coins()
	print("BIG UPS!")

func die():
	$StateMachine.transition_state_to("Dead")
	
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	move_and_slide(motion, Vector2.UP)
	print(motion)
