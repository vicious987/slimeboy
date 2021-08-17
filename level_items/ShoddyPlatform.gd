extends KinematicBody2D

func _ready() -> void:
	$DestroyTimer.connect("timeout", self, "on_DestroyTimer_timeout")
	$Area2D.connect("body_entered", self, "on_Area2D_body_entered")
	$Area2D.connect("body_exited", self, "on_Area2D_exited")
	$DestroyTimer.start()
	$DestroyTimer.paused = true
	
func on_DestroyTimer_timeout() -> void:
	queue_free()

func on_Area2D_body_entered(body):
	$DestroyTimer.paused = false

func on_Area2D_exited(body):
	$DestroyTimer.paused = true

func _physics_process(delta: float) -> void:
	$Label.text = str($DestroyTimer.time_left)
