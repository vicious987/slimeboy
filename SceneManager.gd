extends Node2D

func _ready() -> void:
	$TransitionScreen.connect("transition_done", self, "on_TS_transition_done")

func _process(delta: float) -> void:
	pass
	# this is where we init the transition
	#$TransitionScreen.transition()

func on_TS_transition_done():
	$CurrentScene.get_child(0).queue_free()
	#$CurrentScene.add_child(scn.instance())
