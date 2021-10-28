extends RigidBody2D

export var min_yeet_force = 400
export var max_yeet_force = 1000
export var min_torq = 2000
export var max_torq = 4000

#var direction = Vector2(0.5, -1)
onready var sprite = $Sprite

func _ready() -> void:
	$VisibilityNotifier2D.connect("screen_exited", self, "on_screen_exited")
	
func inst(pos, scalex, scaley):
	position = pos
	sprite.scale.x = scalex
	sprite.scale.y = scaley

func yeet():
	var yeet_force = rand_range(min_yeet_force, max_yeet_force)
	var torq = rand_range(min_torq, max_torq)
	var direction = Vector2(rand_range(0.3, 0.8), -1)
	var side = 1 if randi() % 2 else -1
	direction.x *= side
	apply_impulse(Vector2(0,0), direction * yeet_force)
	add_torque(torq)
	#print("YEET with yforce, torq, dir:", yeet_force, "-", torq,"-", direction)
	
func _physics_process(delta: float) -> void:
	sprite.scale.x = lerp(sprite.scale.x, 1, 1 - pow(0.01, delta))
	sprite.scale.y = lerp(sprite.scale.y, 1, 1 - pow(0.01, delta))

func on_screen_exited():
	queue_free()
