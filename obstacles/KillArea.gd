extends Node2D

func _ready() -> void:
	$Area2D.connect("body_entered", self, "on_Area2D_body_entered")

func on_Area2D_body_entered(body:PhysicsBody2D) -> void:
	if body.get_collision_layer_bit(0): # players layer is on 0
		body.die()
