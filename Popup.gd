extends Popup

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		if get_tree().paused:
			unpause_game()
		else:
			pause_game()

func _ready() -> void:
	$VBoxContainer/ResumeButton.connect("pressed", self, "unpause_game")
	$VBoxContainer/OptionsButton.connect("pressed", self, "open_options")
	$VBoxContainer/QuitButton.connect("pressed", self, "quit_to_menu")
	
func unpause_game() -> void:
	get_tree().paused = false
	hide()

func pause_game() -> void:
	get_tree().paused = true
	show()

func open_options():
	$OptionsMenu.open()

func quit_to_menu():
	unpause_game()
	get_tree().change_scene("res://MainMenu.tscn")
