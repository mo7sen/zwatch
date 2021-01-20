extends Node

var gameUI

var score
var enemies_killed
var headshot_count

var wave_size
var wave_number

var enemies_alive

var spawner_node

var Tower = null

func reset_game():
	score = 0
	enemies_killed = 0
	headshot_count = 0
	
	wave_size = 1
	wave_number = 1
	enemies_alive = wave_size

func _ready():
	reset_game()

func set_spawner(spawner):
	spawner_node = spawner

func incr_score(val):
	score += val
	
func incr_headshotcount(val):
	headshot_count += val

func decr_score(val):
	score -= val

func enemy_killed():
	enemies_killed +=1
	enemies_alive -= 1
	incr_score(1)
	if enemies_alive <= 0:
		yield(get_tree().create_timer(10), "timeout")
		spawn_wave()

func spawn_wave():
	get_tree().call_group("enemies", "queue_free")
	spawner_node.spawn_wave(wave_size)
	wave_number += 1
	enemies_alive = wave_size
	wave_size = 1

func reg_bullet():
	wave_size += 1

func set_tower(tower):
	Tower = tower

func set_healthbar(bar):
	if Tower:
		Tower.set_healthbar(bar)

func lose():
	_ready()
	get_tree().paused = true
	gameUI.showEndGamePanel()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
