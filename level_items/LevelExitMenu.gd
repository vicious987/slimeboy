extends Node2D

signal change_level(level_name)

export var next_level_name = "default"

func _ready() -> void:
	$Area2D.connect("body_entered", self, "on_Area2D_body_entered")

#collision bit set to player only
func on_Area2D_body_entered(body:PhysicsBody2D):
	#call_deferred("emit_signal", "change_level", "res://levels/" + next_level_name + ".tscn")
	#get_tree().paused = true
	print("yabada")
	get_tree().change_scene("res://ui_elements/MainMenu.tscn")
