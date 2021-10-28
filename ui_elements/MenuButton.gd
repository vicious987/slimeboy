extends TextureButton

func _ready() -> void:
	connect("pressed", self, "on_pressed")

func on_pressed():
	$ClickSound.play()
