extends CharacterBody2D

var health := 100


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += 980.0 * delta

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		velocity.x = direction * 300.0
	else:
		velocity.x = move_toward(velocity.x, 0, 300.0)

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = -450.0
		$JumpSound.play()

	move_and_slide()

	if Input.is_action_just_pressed("ui_cancel"):
		health -= 10
		if health < 0:
			health = 0
		$HurtSound.play()

	$HUD/HealthBar.value = health
	if health <= 30:
		$HUD/HealthBar.modulate = Color(1, 0.2, 0.2)
	else:
		$HUD/HealthBar.modulate = Color(1, 1, 1)
	if health <= 0:
		$HUD/StatusLabel.text = "Game Over"
	elif health <= 30:
		$HUD/StatusLabel.text = "Low health!"
	else:
		$HUD/StatusLabel.text = ""
