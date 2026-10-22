extends CharacterBody2D

@export var enemy_type := "patrol"
@export var target: Node2D

var start_position := Vector2.ZERO
var patrol_direction := 1.0


func _ready():
	start_position = global_position


func _physics_process(_delta):
	if enemy_type == "patrol":
		if global_position.x > start_position.x + 150.0:
			patrol_direction = -1.0
		elif global_position.x < start_position.x - 150.0:
			patrol_direction = 1.0
		velocity = Vector2(patrol_direction * 100.0, 0.0)
	elif enemy_type == "chase":
		if target:
			var to_target := target.global_position - global_position
			if to_target.length() > 10.0:
				velocity = to_target.normalized() * 120.0
			else:
				velocity = Vector2.ZERO
		else:
			velocity = Vector2.ZERO
	move_and_slide()
