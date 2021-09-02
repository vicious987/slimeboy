extends Node
export(int,0,30) var paused_volume_diff = 10
export(float,0,1) var paused_pitch_diff = 0.05

func _ready() -> void:
	$GUI/PauseMenu.connect("resumed", self, "unpause_game")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		if get_tree().paused:
			unpause_game()
		else:
			pause_game()

func unpause_game() -> void:
	get_tree().paused = false
	$BackgroundMusic.volume_db += paused_volume_diff
	$BackgroundMusic.pitch_scale += paused_pitch_diff
	$GUI/PauseMenu.hide()

func pause_game() -> void:
	get_tree().paused = true
	$BackgroundMusic.volume_db -= paused_volume_diff
	$BackgroundMusic.pitch_scale -= paused_pitch_diff
	$GUI/PauseMenu.show()
