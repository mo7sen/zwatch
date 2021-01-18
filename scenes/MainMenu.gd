extends Control

var gameScene = load("res://scenes/World.tscn")

func _on_NewGame_Button_pressed():
	get_tree().change_scene_to(gameScene)


func _on_QuitGame_Butoon_pressed():
	get_tree().quit()
