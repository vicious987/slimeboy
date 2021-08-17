extends KinematicBody2D

var motion = Vector2()

var can_coyotejump = false

func _ready():
	$CoyoteTimer.connect("timeout", self, "on_CoyoteTimer_timeout")

func on_CoyoteTimer_timeout():
	can_coyotejump = false

func start_coyote_timer():
	can_coyotejump = true
	$CoyoteTimer.start()

func die():
	$StateMachine.death_transition()
	
func collect_coin():
	print("big ups!")	
	

func _physics_process(delta: float) -> void:
	move_and_slide(motion, Vector2.UP)
	#print($CoyoteTimer.time_left)
	#print(motion)
