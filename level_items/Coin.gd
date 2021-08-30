extends Node2D

func _ready() -> void:
	$KinematicBody2D/Area2D.connect("body_entered", self, "on_Area2D_body_entered")
	add_to_group("Collectables")
	
func on_Area2D_body_entered(body:PhysicsBody2D) -> void:
	if body.get_collision_layer_bit(0): # 0 for player layer
		Gamestate.incr_score()
		hide()

func hide():
		$KinematicBody2D/Area2D/Sprite.set_deferred("visible",false)
		$KinematicBody2D/Area2D/CollisionShape2D.set_deferred("disabled",true)
	
func show():
		$KinematicBody2D/Area2D/Sprite.visible = true
		$KinematicBody2D/Area2D/CollisionShape2D.disabled = false
