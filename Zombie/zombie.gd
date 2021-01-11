extends KinematicBody

onready var animation_tree = $AnimationTree
onready var animation_playback = animation_tree.get("parameters/playback")

onready var zombie_model = $ZombieModel

onready var navigation = get_parent().get_parent()

onready var gravity = ProjectSettings.get_setting("physics/3d/default_gravity") * ProjectSettings.get_setting("physics/3d/default_gravity_vector")

onready var initial_position = transform.origin

var motion = Vector2()
var velocity = Vector3()
var orientation = Transform()
var root_motion = Transform()

var path = []
var path_node = 0

export var hit_points = 30;

func _ready():
	orientation.origin = Vector3()
	animation_playback.start("Walking")
	orientation = zombie_model.global_transform
	
func _physics_process(delta):
	root_motion = animation_tree.get_root_motion_transform()
	orientation *= root_motion
	
	if path_node < path.size():
		var h_velocity = orientation.origin / delta
		velocity.x = h_velocity.x
		velocity += gravity * delta
		velocity.z = h_velocity.z
		velocity = move_and_slide(velocity, Vector3.UP)

		orientation.origin = Vector3()
		global_transform.basis = orientation.basis
	
		var direction3 = (path[path_node]) - global_transform.origin
		var angle = (global_transform.basis.z).angle_to(direction3);
		if global_transform.basis.z.cross(direction3).dot(Vector3.UP) > 0:
				angle *= -1
		var direction2 = Vector2(angle, PI)
		set_direction(direction2.normalized())
		
		if direction3.length() < 15:
			path_node += 1
	else:
		attack()
		set_direction(Vector2(0,0))
		
func set_target(t):
	path = navigation.get_simple_path(global_transform.origin, t)
	
func bullet_hit(dmg):
	get_hit(dmg)

func set_direction(dir):
	animation_tree.set("parameters/Walking/BlendSpace2D/blend_position", dir)

func get_hit(dmg):
	animation_playback.travel("getHit")
	hit_points -= dmg
	if(hit_points <= 0):
		die()

func die():
	GameControl.enemy_killed()
	$BodyCollider.disabled = true
	$ZombieModel/root/Skeleton/BoneAttachment/End001/KinematicBody/HeadCollider.disabled = true
	animation_tree.set("parameters/conditions/isDead", true)
	gravity = Vector3(0,0,0)

func attack():
	animation_tree.set("parameters/conditions/isWalking", false)
	animation_tree.set("parameters/conditions/isAttacking", true)
