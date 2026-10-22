extends Area2D

var is_open := false
var player_nearby := false


func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)


func _on_body_entered(body):
	if body.name == "Player":
		player_nearby = true


func _on_body_exited(body):
	if body.name == "Player":
		player_nearby = false


func _unhandled_input(event):
	if player_nearby and not is_open and event.is_action_pressed("ui_accept"):
		open()


func open():
	is_open = true
	$Visual.color = Color(0.3, 0.8, 0.3)
	get_node("../Player").on_door_opened()
