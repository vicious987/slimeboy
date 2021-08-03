extends Node

var current_state = null
var previous_state = null
onready var state_map = {}

func die():
	get_parent().die()
	
func collect_coin():
	print("BIG UPS!")
	
func _ready():
	for c in $States.get_children():
		state_map[c.name] = c
	current_state = state_map["Idle"]
	for s in state_map.values():
		s.connect("done", self, "_on_State_done")
		
func _input(event):
	current_state.handle_input(event)

func _on_State_done(new_state_name_str):
	print(" change from ", current_state.name, " into ", new_state_name_str)
	previous_state = current_state
	current_state.exit(self)
	current_state = state_map[new_state_name_str]
	current_state.enter(self)

func _physics_process(delta):
	current_state.update(self, delta)
	#print(current_state.motion)
