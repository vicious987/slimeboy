extends State
class_name AirState

export var jumps:int = 1

var gravity_per_sec
var jump_speed

export(int) var jump_height = 200
export(float) var jump_time = 0.4
export(int) var horizontal_maneuverability = 600
export(float,0,1) var acc_factor = 0.2
export(float) var gravity_speed_cap = 1000

func _ready() -> void:
	gravity_per_sec = 2 * jump_height / pow(jump_time, 2)
	jump_speed = -sqrt(2 * gravity_per_sec * jump_height)
	
func update(delta) -> void:
	input_direction = get_input_direction()
	update_sprite_direction(input_direction)

	if input_direction and surface_detector.is_next_to_wall():
		emit_signal("done", "Wallslide")
	
	player_body.motion.y = min(player_body.motion.y + gravity_per_sec * delta, gravity_speed_cap)
	player_body.motion.x = lerp(player_body.motion.x, input_direction * horizontal_maneuverability, acc_factor)
	
	#squash&stretch
	sprite.scale.y = range_lerp(abs(player_body.motion.y), 0, abs(jump_speed), 2.0, 0.5)
	sprite.scale.x = range_lerp(abs(player_body.motion.y), 0, abs(jump_speed), 0.5, 1.5)
