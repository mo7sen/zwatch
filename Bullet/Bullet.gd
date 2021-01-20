extends Spatial

signal bullet_end

var BULLET_SPEED = 300

const KILL_TIMER = 2
var timer = 0

var velocity
var target
var prev_distance = INF

func _process(delta):
	global_transform.origin += velocity * delta
	if target != null:
		var current_distance = (global_transform.origin - target).length()
		if current_distance > prev_distance:
			emit_signal("bullet_end")
			queue_free()
		else:
			prev_distance = current_distance
	timer += delta
	if timer >= KILL_TIMER:
		queue_free()

func set_target(t):
	var direction
	if t != null:
		direction = (t - global_transform.origin).normalized()
		target = t
	else:
		direction = global_transform.basis.z.normalized()
		target = null
	
	velocity = direction * BULLET_SPEED
