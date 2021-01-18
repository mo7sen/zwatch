extends Panel

func _ready():
	GameControl.endPanel = self
	visible = false

func show():
	visible = true;
	$Score.text = "Score:" + str(GameControl.score)
	$HeadShootScore.text = "Head Shoots: " + str(GameControl.headshoot_score)
	$EnemiesKilledScore.text = "Enemies Killed: " + str(GameControl.enemies_killed)


func _on_EndButton_pressed():
	print("pressed end")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	var _a = get_tree().change_scene("res://scenes/MainMenu.tscn")
