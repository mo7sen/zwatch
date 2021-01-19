extends Control

onready var score = $Score

func _ready():
	GameControl.gameUI = self	
	$PausePanel.visible = false
	$EndGamePanel.visible = false

func _process(_delta):
	score.text = "Score: " + str(GameControl.score)
	
	if(Input.is_action_just_pressed("ui_cancel")):
		get_tree().paused = true
		$PausePanel.visible = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
func showEndGamePanel():
	$EndGamePanel.visible = true;
	$EndGamePanel/Score.text = "Score:" + str(GameControl.score)
	$EndGamePanel/HeadShotScore.text = "Headshots: " + str(GameControl.headshot_count)
	$EndGamePanel/EnemiesKilledScore.text = "Enemies Killed: " + str(GameControl.enemies_killed)

func _on_EndButton_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	var _a = get_tree().change_scene("res://scenes/MainMenu.tscn")

func _on_ResumeButton_pressed():
	get_tree().paused = false
	$PausePanel.visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_QuitButton_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	var _a = get_tree().change_scene("res://scenes/MainMenu.tscn")
