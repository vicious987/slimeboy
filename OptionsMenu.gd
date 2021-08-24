extends Control

var fullscreen:bool = false
var resolution = Vector2(800,600)
var bgm_volume
var sfx_volume
#onready var resolution = $VBoxContainer/Resolution/ResolutionPicker.

func _ready() -> void:
	#hide()
	$VBoxContainer/Buttons/BackButton.connect("pressed", self, "close_options")
	$VBoxContainer/Buttons/ApplyButton.connect("pressed", self, "apply_options")
	$VBoxContainer/Resolution/FullscreenBox.connect("toggled", self, "toggle_fullscreen")
	$VBoxContainer/Resolution/ResolutionPicker.connect("item_selected", self, "set_new_res")
	$VBoxContainer/VolumeBGM/HSlider.connect("value_changed", self, "set_bgm_volume")
	$VBoxContainer/VolumeSFX/HSlider.connect("value_changed", self, "set_sfx_volume")

func close_options():
	hide()

func toggle_fullscreen(status):
	self.fullscreen = status

func set_new_res(item_id):
	var res = $VBoxContainer/Resolution/ResolutionPicker.get_item_text(item_id).split("x")
	self.resolution = Vector2(int(res[0]), int(res[1]))
	
func apply_options():
	OS.window_fullscreen = self.fullscreen
	OS.window_size = self.resolution

func set_bgm_volume(val):
	self.bgm_volume = val
	$VBoxContainer/VolumeBGM/Label2.text = str(val)

func set_sfx_volume(val):
	self.sfx_volume = val
	$VBoxContainer/VolumeSFX/Label2.text = str(val)	
