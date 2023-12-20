extends "res://scripts/baseCharacter.gd"

class_name naruto

func _ready():
	maxHealth = 100
	maxChakra = 3
	damage = 16
	skill_1_cooldown = 10
	skill_2_cooldown = 15
	skill_3_cooldown = 30
# warning-ignore:return_value_discarded
	connect("attackStarted",self,"_on_attack")

func _on_attack(damage):
	$hitBox.damage = damage
	$hitBox/CollisionShape2D.disabled = false
	$hitBox.show()
	yield(get_tree().create_timer(0.3),"timeout")
	$hitBox/CollisionShape2D.disabled = true
	$hitBox.hide()

func kageBunshin():
	pass

func rasengen():
	pass

func nineTail():
	pass
