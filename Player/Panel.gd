extends Control


func _process(_delta):
	$Score.text = "Score: " + str(GameControl.score)
