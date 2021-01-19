extends Control

onready var gameScene# = preload("res://scenes/World.tscn")

func _on_QuitGame_Butoon_pressed():
	get_tree().quit()

func _ready():
	gameScene = preload("res://scenes/World.tscn")

func _on_NewGame_Button_button_down():
	get_tree().change_scene_to(gameScene)
