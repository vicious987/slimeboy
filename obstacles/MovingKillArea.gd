extends Path2D

onready var pf = $PathFollow2D
export var unit_speed = 0.01

func _physics_process(delta: float) -> void:
	pf.unit_offset += unit_speed
	if pf.unit_offset == 1 or pf.unit_offset == 0:
		unit_speed = -unit_speed
	
