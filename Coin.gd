extends Node2D

func _ready() -> void:
	$Area2D.connect("body_entered", self, "on_Area2D_body_entered")
	
func on_Area2D_body_entered(body:PhysicsBody2D) -> void:
	if body.get_collision_layer_bit(0): # 0 for player layer
		body.collect_coin()
		queue_free()
