extends Spatial

export(PackedScene) var zombie
export(NodePath) var target_path
onready var target = get_node(target_path)

func _ready():
	GameControl.spawner_node = self
	randomize()


func _on_Timer_timeout():
	spawn_enemy()

func spawn_enemy():
	$SpawnPath/SpawnLocation.offset = randi()
	var zombie_instance = zombie.instance()
	add_child(zombie_instance)
	zombie_instance.global_transform.origin = $SpawnPath/SpawnLocation.global_transform.origin
	zombie_instance.global_transform.origin.y = 0
	zombie_instance.set_target(target.global_transform.origin)

func spawn_wave(wave_size):
	for _n in range(wave_size):
		spawn_enemy()
