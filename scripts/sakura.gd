extends "res://scripts/baseCharacter.gd"

class_name sakura

func _ready():
	maxHealth = 50
	maxChakra = 2
	damage = 12
	skill_1_cooldown = 10
	skill_2_cooldown = 15
	skill_3_cooldown = 30
# warning-ignore:return_value_discarded
	connect("attackStarted",self,"_on_attack")
	$cooldownUI.connect("spellCast",self,"_onCastSpell")

func _on_attack(damage):
	$hitBox.damage = damage
	$hitBox/CollisionShape2D.disabled = false
	$hitBox.show()
	yield(get_tree().create_timer(0.3),"timeout")
	$hitBox/CollisionShape2D.disabled = true
	$hitBox.hide()

func _onCastSpell(spellID):
	match spellID:
		"1":
			shanara()
		"2":
			heal()
		"3":
			iCanbeUseful()

func shanara():
	pass

func heal():
	pass

func iCanbeUseful():
	if canCast == true:
		print("I cast I can be useful")
		damage = 100
		$buff.show()
		$buffTimer.start()
	else:
		pass
		
func _on_buffTimer_timeout():
	canCast = false
	damage = 12
	$buff.hide()
