extends Timer

var zombie = preload("res://Zombie/Zombie.tscn")
export(NodePath) var tower_path
onready var tower = get_node(tower_path)

func _on_Timer_timeout():
	var zombie_instance = zombie.instance()
	var root = get_tree().root.get_children()[0]
	root.add_child(zombie_instance)
	zombie_instance.set_target(tower.global_transform.origin)
	zombie_instance.global_transform.origin = tower.global_transform.origin - Vector3(100, 0, 100)
	zombie_instance.global_transform.origin.y = 0
