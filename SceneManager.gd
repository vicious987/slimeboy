extends Node

onready var current_level = $level
var next_level_name:String

func _ready() -> void:
	$TransitionScreen.connect("transition_in_done", self, "on_TS_transition_in_done")
	current_level.connect("level_changed", self, "transition_level")
	#$MainMenu.connect("start_level", self, "transition_level")

func transition_level(new_level:String) -> void:
	$TransitionScreen.transition_in()
	next_level_name = new_level
	#continue when transition_in is done

func on_TS_transition_in_done() -> void:
	var next_level = load(next_level_name).instance()
	add_child(next_level)
	current_level.queue_free()
	current_level = next_level
	current_level.connect("level_changed", self, "transition_level")
	$TransitionScreen.transition_out()
