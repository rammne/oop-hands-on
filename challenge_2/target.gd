extends Node2D
# Test helper only: move the green target with the arrow keys.
# Not part of the challenge; students do not need to change this file.

const SPEED := 250.0


func _process(delta):
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	position += direction * SPEED * delta
