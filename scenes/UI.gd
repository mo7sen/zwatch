extends Navigation

func _process(_delta):
	if(Input.is_action_just_pressed("ui_cancel")):
		get_tree().change_scene("res://scenes/MainMenu.tscn")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
