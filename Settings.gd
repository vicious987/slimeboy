extends Node

var resolution_list = [Vector2(800,600), Vector2(1024,600), Vector2(1366,600)]
var resolution_id:int = 1
var fullscreen:bool = false
var bgm_volume:int = 50
var sfx_volume:int = 50

func apply():
	OS.window_fullscreen = fullscreen
	OS.window_size = resolution_list[resolution_id]
