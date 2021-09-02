extends Label

func _ready() -> void:
	connect("mouse_entered", self, "on_mouse_entered")
	$CreditsPopup.connect("mouse_exited", self, "on_mouse_exited")
	
func on_mouse_entered():
	$CreditsPopup.show()

func on_mouse_exited():
	$CreditsPopup.hide()
