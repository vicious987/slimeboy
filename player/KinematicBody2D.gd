extends KinematicBody2D

var motion = Vector2()

var can_coyotejump = false
onready var ragdoll = preload("res://player/DeadRagdoll.tscn")

func _ready():
	$CoyoteTimer.connect("timeout", self, "on_CoyoteTimer_timeout")

func on_CoyoteTimer_timeout():
	can_coyotejump = false

func start_coyote_timer():
	can_coyotejump = true
	$CoyoteTimer.start()

#rewrite
func die():
	print(":(")
	$StateMachine.death_transition()
	var rg = ragdoll.instance()
	get_parent().add_child(rg)
	#get_parent().call_deferred("add_child", rg)
	rg.inst(position, $Sprite.scale.x, $Sprite.scale.y)
	rg.yeet()

func _physics_process(delta: float) -> void:
	move_and_slide(motion, Vector2.UP)
	#print(motion)
