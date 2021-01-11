extends Spatial

export(NodePath) var target_raycast
export(NodePath) var ammo_label_path
onready var ray = get_node(target_raycast)
onready var ammo_label = get_node(ammo_label_path)

onready var AnimationTree = $AnimationTree

func _ready():
	$Armature/Skeleton/BoneAttachment/Revolver.init()

func can_shoot():
	return $Armature/Skeleton/BoneAttachment/Revolver.can_shoot()

func can_reload():
	return $Armature/Skeleton/BoneAttachment/Revolver.can_reload()

