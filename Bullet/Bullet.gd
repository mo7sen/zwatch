extends Spatial

var BULLET_SPEED = 0.1

const KILL_TIMER = 10
var timer = 0

var target

func _process(delta):
	global_transform.origin = lerp(global_transform.origin, target, BULLET_SPEED)
	timer += delta
	if timer >= KILL_TIMER or (global_transform.origin - target).length() < 0.2:
		queue_free()

func set_target(t):
	if t != null:
		target = t
	else:
		target = global_transform.basis.z * 100
