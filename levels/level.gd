extends Node2D

export(String) var level_name = "default_level_name"
signal level_changed(new_level_name)

func _ready() -> void:
	$LevelExit.connect("change_level", self, "on_LevelExit_change_level")

func on_LevelExit_change_level(new_level_name):
	emit_signal("level_changed", new_level_name)
