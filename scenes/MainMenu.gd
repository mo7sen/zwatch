extends Control

onready var gameScene = preload("res://scenes/World.tscn")

func _on_NewGame_Button_pressed():
	var _a = get_tree().change_scene_to(gameScene)
	
func _on_QuitGame_Butoon_pressed():
	get_tree().quit()
