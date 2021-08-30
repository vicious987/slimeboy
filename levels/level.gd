extends Node2D

export(String) var level_name = "default_level_name"
signal level_changed(new_level_name)

func _ready() -> void:
	$LevelExit.connect("change_level", self, "on_LevelExit_change_level")
	$Player.connect("reseted", self, "on_Player_reseted")
	get_tree().paused = false

func on_LevelExit_change_level(new_level_name):
	emit_signal("level_changed", new_level_name)

func on_Player_reseted():
	get_tree().call_group("Collectables", "show")
	Gamestate.reset_score()
