extends Control

var current_score = 0
var max_score = 3

func _ready() -> void:
	update_label()
	Gamestate.connect("score_changed", self, "on_score_changed")

func update_current_score(new_score:int):
	current_score = new_score
	update_label()

func update_max_score(new_maxscore:int):
	max_score = new_maxscore
	update_label()

func update_label():
	$PanelContainer/HBoxContainer/Label.text = str(current_score) + " / " + str(max_score)

func on_score_changed(newscore):
	update_current_score(newscore)
