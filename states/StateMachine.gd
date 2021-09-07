extends Node

var current_state = null

onready var state_map = {}
onready var player_body = get_parent()
	
func _ready():
	for c in get_children():
		c.connect("done", self, "transition_state_to") # move it to connector's responsobility?
		state_map[c.name] = c

	current_state = state_map["Idle"]
		
func _input(event):
	current_state.handle_input(event)

func transition_state_to(new_state_name_str):
	#print(" change from ", current_state.name, " into ", new_state_name_str)
	assert(current_state.name != new_state_name_str)
	current_state.exit()
	current_state = state_map[new_state_name_str]
	current_state.enter()

func _physics_process(delta):
	current_state.update(delta)
	
func death_transition():
	if current_state.name != "Dead":
		transition_state_to("Dead")
	
