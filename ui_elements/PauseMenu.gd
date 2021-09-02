extends Popup

signal resumed()

func _ready() -> void:
	$VBoxContainer/ResumeButton.connect("pressed", self, "click_unpause")
	$VBoxContainer/OptionsButton.connect("pressed", self, "open_options")
	$VBoxContainer/QuitButton.connect("pressed", self, "quit_to_menu")
	
func click_unpause():
	emit_signal("resumed")
	
func open_options():
	$OptionsMenu.open()

func quit_to_menu():
	#unpause_game()
	get_tree().change_scene("res://ui_elements/MainMenu.tscn")
