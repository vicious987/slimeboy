extends RigidBody2D

export var yeet_force = 500
export var tor = 2000

var direction = Vector2(0.5,-1)

func _ready() -> void:
	apply_impulse(Vector2(0,0), direction * yeet_force)
	add_torque(tor)
