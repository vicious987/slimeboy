extends Node2D

export(float) var rotation_speed = 0.15

func _physics_process(delta: float) -> void:
	$Sprite.rotate(rotation_speed)
