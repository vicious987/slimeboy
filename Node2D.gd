extends Node2D
onready var variable = "test"

func _init():
	print("INIT:  ", variable)

func _ready():
	print("READY: ", variable)
