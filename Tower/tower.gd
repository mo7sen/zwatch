extends Spatial

const MAX_HEALTH = 100
var current_health = MAX_HEALTH

var healthbar = null

func attack(dmg):
	current_health -= dmg
	if current_health <= 0:
		GameControl.lose()

func _on_Area_body_entered(body):
	print(body.name + "entered in the attack zone")
	if body.has_method("set_attack"):
		body.set_attack(true, self)


func _on_Area_body_exited(_body):
#	if body.has_method("set_attack"):
#		body.set_attack(false, null)
	pass

func _physics_process(_delta):
	healthbar.set_value(current_health)

func _ready():
	GameControl.set_tower(self)

func set_healthbar(bar):
	healthbar = bar
