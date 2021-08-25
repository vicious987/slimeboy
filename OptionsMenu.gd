extends Control

var res_picker:OptionButton

func _ready() -> void:
	res_picker = $VBoxContainer/Resolution/Picker
	for r in Settings.resolution_list:
		res_picker.add_item(str(r), res_picker.get_item_count() + 1)
	$VBoxContainer/VolumeBGM/HSlider.connect("value_changed", self, "set_bgm_volume")
	$VBoxContainer/VolumeSFX/HSlider.connect("value_changed", self, "set_sfx_volume")
	$VBoxContainer/Buttons/BackButton.connect("pressed", self, "close")
	$VBoxContainer/Buttons/ApplyButton.connect("pressed", self, "apply_options")
	load_settings() # seperate testing purposes

func close():
	hide()
	
func open():
	load_settings()
	show()

func apply_options():
	save_settings()
	Settings.apply()

func load_settings():
	$VBoxContainer/VolumeBGM/HSlider.value = Settings.bgm_volume
	$VBoxContainer/VolumeSFX/HSlider.value = Settings.sfx_volume
	$VBoxContainer/Resolution/FullscreenBox.pressed = Settings.fullscreen
	res_picker.select(Settings.resolution_id)
	
func save_settings():
	Settings.bgm_volume = $VBoxContainer/VolumeBGM/HSlider.value
	Settings.sfx_volume = $VBoxContainer/VolumeSFX/HSlider.value
	Settings.fullscreen = $VBoxContainer/Resolution/FullscreenBox.pressed
	Settings.resolution_id = res_picker.selected

func set_bgm_volume(val):
	$VBoxContainer/VolumeBGM/Label2.text = str(val)

func set_sfx_volume(val):
	$VBoxContainer/VolumeSFX/Label2.text = str(val)	
