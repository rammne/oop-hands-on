extends CanvasLayer


func _process(_delta):
	var door = get_node("../Door")
	if door.is_open:
		$StatusLabel.text = "Door: OPEN"
	else:
		$StatusLabel.text = "Door: closed"
