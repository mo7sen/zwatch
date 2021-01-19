extends Control

onready var gameScene

func _ready():
	$SettingsPanel.visible = false
	gameScene = preload("res://scenes/World.tscn")
	
func _on_NewGame_Button_pressed():
	GameControl.score = 0
	get_tree().paused = false	
	get_tree().change_scene_to(gameScene)

func _on_QuitGame_Butoon_pressed():
	get_tree().quit()

func _on_SettingsButton_pressed():
	$SettingsPanel.visible = true

func _on_DoneButton_pressed():
	$SettingsPanel.visible = false
