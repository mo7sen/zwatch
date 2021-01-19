extends Panel

func _ready():
	GameControl.endPanel = self
	visible = false

func show():
	visible = true;
	$Score.text = "Score:" + str(GameControl.score)
	$HeadShotScore.text = "Headshots: " + str(GameControl.headshot_count)
	$EnemiesKilledScore.text = "Enemies Killed: " + str(GameControl.enemies_killed)


func _on_EndButton_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	var _a = get_tree().change_scene("res://scenes/MainMenu.tscn")
