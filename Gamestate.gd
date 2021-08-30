extends Node

#it's probably not a good method to make score work
#but it's a fast one
signal score_changed(newscore)
var score = 0

func incr_score():
	score += 1
	emit_signal("score_changed", score)

func reset_score():
	score = 0
	emit_signal("score_changed", score)

