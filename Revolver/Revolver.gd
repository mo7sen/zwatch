extends Spatial

onready var bullet = preload("res://Bullet/Bullet.tscn")

const DAMAGE = 20
const MAG_SIZE = 6
const MAX_SPARE_AMMO = INF
var current_ammo = MAG_SIZE

func init():
	update_ammo_label()

func _ready():
	pass

func update_ammo_label():
	var ammo_label = get_owner().ammo_label
	ammo_label.text = str(current_ammo) + " / 999"


func reload():
	current_ammo = MAG_SIZE
	update_ammo_label()

func can_shoot():
	return current_ammo > 0

func can_reload():
	return current_ammo < MAG_SIZE

func fire():
	AudioManager.play("res://assets/audio/revolver_shot.wav")
	var bullet_clone = bullet.instance()
	var root = get_tree().root.get_children()[0]
	root.add_child(bullet_clone)
	bullet_clone.global_transform = self.global_transform
	var bullet_offset = Vector3(0, 0, 0)
	bullet_clone.global_transform.origin += bullet_offset
	
	var ray = get_owner().ray
	ray.force_raycast_update()
	if ray.is_colliding():
		var target_collision = ray.get_collision_point()
		bullet_clone.set_target(target_collision)
		var target_body = ray.get_collider()
		if target_body.has_method("bullet_hit"):
			target_body.bullet_hit(DAMAGE)
		
	else:
		bullet_clone.set_target(null)
	
	current_ammo -= 1
	update_ammo_label()
	GameControl.reg_bullet()
