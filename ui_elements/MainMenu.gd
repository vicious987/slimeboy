extends Control

func _ready() -> void:
	$MenuButtons/StartButton.connect("pressed", self, "start_game")
	$MenuButtons/OptionsButton.connect("pressed", self, "open_options")
	$MenuButtons/ExitButton.connect("pressed", self, "quit_game")

func quit_game():
	get_tree().quit()

func open_options():
	$OptionsMenu.open()
	
func start_game():
	get_tree().change_scene("res://Game.tscn")
