extends ColorRect


var value = 100
var target_value = 100

func _physics_process(_delta):
	value = lerp(value, target_value, 0.07)
	self.material.set("shader_param/health", value)

func set_value(val):
	target_value = val
