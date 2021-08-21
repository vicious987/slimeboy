extends Control

signal start_level(level_name)

func _ready() -> void:
	$VBoxContainer/StartButton.connect("pressed", self, "start_game")
	$VBoxContainer/OptionsButton.connect("pressed", self, "open_options")
	$VBoxContainer/ExitButton.connect("pressed", self, "quit_game")

func quit_game():
	get_tree().quit()

func open_options():
	pass
	
func start_game():
	get_tree().change_scene("res://Game.tscn")
	#emit_signal("start_level", "res://levels/level_1.tscn")