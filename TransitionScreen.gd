extends CanvasLayer

signal transition_done

func _ready() -> void:
	$AnimationPlayer.connect("animation_finished", self, "on_animation_finished")
	transition()
	
func transition():
	$AnimationPlayer.play("fade_to_black")

func on_animation_finished(animation_name):
	if animation_name == "fade_to_black":
		emit_signal("transition_done")
		$AnimationPlayer.play("fade_to_normal")
