extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var score

var wave_size
var wave_number

var enemies_alive

var spawner_node

# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0
	wave_size = 1
	wave_number = 1
	enemies_alive = wave_size

func set_spawner(spawner):
	spawner_node = spawner

func incr_score(val):
	score += val

func decr_score(val):
	score -= val

func enemy_killed():
	enemies_alive -= 1
	score += 1
	if enemies_alive <= 0:
		spawn_wave()

func spawn_wave():
	spawner_node.spawn_wave(wave_size)
	wave_number += 1
	enemies_alive = wave_size
	wave_size = 1
	pass

func reg_bullet():
	wave_size += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
