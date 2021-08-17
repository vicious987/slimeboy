extends Node2D



func _ready() -> void:
	$Area2D.connect("body_entered", self, "on_Area2D_body_entered")

#collision bit set to player only
func on_Area2D_body_entered(body:PhysicsBody2D):
	print("bye!")
	get_tree().change_scene("res://levels/lvl2.tscn")
