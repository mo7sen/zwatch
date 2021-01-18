extends Control

var gameScene = load("res://scenes/World.tscn").instance()

func _on_NewGame_Button_pressed():
	var level = get_tree().root.get_node("Control")
	get_tree().root.add_child(gameScene)
	get_tree().root.remove_child(level)
	level.call_deferred("free")


func _on_QuitGame_Butoon_pressed():
	get_tree().quit()
