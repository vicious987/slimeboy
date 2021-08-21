extends CanvasLayer

signal transition_in_done

func _ready() -> void:
	$AnimationPlayer.connect("animation_finished", self, "on_animation_finished")
	
func transition_in():
	$AnimationPlayer.play("fade_to_black")
	
func transition_out():
	$AnimationPlayer.play("fade_to_normal")

func on_animation_finished(animation_name):
	if animation_name == "fade_to_black":
		emit_signal("transition_in_done")

