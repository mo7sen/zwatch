extends Control

func _on_NewGame_Button_pressed():
	var _a = get_tree().change_scene("res://scenes/World.tscn")


func _on_QuitGame_Butoon_pressed():
	get_tree().quit()
