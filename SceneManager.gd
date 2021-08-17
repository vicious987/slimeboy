extends Node2D

var path_list = []

func _ready() -> void:
	path_list.append("res://levels/lvl1.tscn")
	path_list.append("res://levels/lvl2.tscn")
	$TransitionScreen.connect("transition_done", self, "on_TS_transition_done")

func _process(delta: float) -> void:
	pass
	# this is where we init the transition
	#$TransitionScreen.transition()

func on_TS_transition_done():
	$CurrentScene.get_child(0).queue_free()
	#$CurrentScene.add_child(scn.instance())
