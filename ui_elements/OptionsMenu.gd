extends Control

onready var graphics_container = $TextureRect/MarginContainer/VBoxContainer/GraphicsContainer
onready var volume_container = $TextureRect/MarginContainer/VBoxContainer/VolumeContainer
onready var button_container = $TextureRect/MarginContainer/VBoxContainer/Buttons

func _ready() -> void:
	var res_picker = graphics_container.get_node("ResolutionPicker")
	for r in Settings.resolution_list:
		res_picker.add_item(str(r), res_picker.get_item_count() + 1)
	volume_container.get_node("BGMHSlider").connect("value_changed", self, "on_bgm_slider_moved")
	volume_container.get_node("SFXHSlider").connect("value_changed", self, "on_sfx_slider_moved")
	button_container.get_node("BackButton").connect("pressed", self, "on_back_clicked")
	button_container.get_node("ApplyButton").connect("pressed", self, "on_apply_clicked")
	load_settings() # scene testing purpose, comment out when not needed

func close():
	hide()
	
func open():
	load_settings()
	show()

func apply_options():
	save_settings()
	Settings.apply()

func load_settings():
	volume_container.get_node("SFXHSlider").value = Settings.sfx_volume
	volume_container.get_node("BGMHSlider").value = Settings.bgm_volume
	graphics_container.get_node("FullscreenBox").pressed = Settings.fullscreen
	graphics_container.get_node("ResolutionPicker").select(Settings.resolution_id)
	
func save_settings():
	Settings.bgm_volume = volume_container.get_node("BGMHSlider").value
	Settings.sfx_volume = volume_container.get_node("SFXHSlider").value
	Settings.fullscreen = graphics_container.get_node("FullscreenBox").pressed
	Settings.resolution_id = graphics_container.get_node("ResolutionPicker").selected

func on_back_clicked():
	close()
	
func on_apply_clicked():
	apply_options()
	
func on_bgm_slider_moved(val):
	volume_container.get_node("BGMValueLabel").text = str(val)

func on_sfx_slider_moved(val):
	volume_container.get_node("SFXValueLabel").text = str(val)	
