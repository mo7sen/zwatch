extends ColorRect

export(Color) var crosshair_color = Color(1.0, 0.0, 0.0);
export(int) var crosshair_style = 0;

func _physics_process(delta):
	self.material.set("material/shader/resource_path", "res://Player/Crosshair1.shader")
	self.material.set_shader_param("crosshair_color", crosshair_color)
