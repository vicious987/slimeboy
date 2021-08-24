extends Control

func _ready() -> void:
	$VBoxContainer/Buttons/BackButton.connect("pressed",self, "exit_options")
	$VBoxContainer/Buttons/ApplyButton.connect("pressed",self, "apply_options")

func exit_option(return_dir:String):
	pass
