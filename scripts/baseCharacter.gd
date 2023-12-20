extends KinematicBody2D

class_name basePlayer
signal attackStarted(damage)
signal die

# stats
var maxHealth = 100
var currentHealth
var maxChakra
var currentChakra
var movementSpeed = 200
var damage = 5
var velocity = Vector2.ZERO

# spell stats
var canCast = true

# base cooldowns
var skill_1_cooldown = 5
var skill_2_cooldown = 8
var skill_3_cooldown = 10
var ultimate_cooldown 

func _ready():
	initialize()

func initialize():
	currentHealth = maxHealth
	currentChakra = maxChakra

func _physics_process(delta):
	move(delta)
	
func _input(event):
	attack(event)
	
func die():
	if currentHealth <= maxHealth:
		currentHealth = 0
		emit_signal("die")

func attack(event):
	if event.is_action_pressed("ui_accept"):
		emit_signal("attackStarted",damage)

func move(_delta):
	velocity = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1

	velocity = velocity.normalized() * movementSpeed
# warning-ignore:return_value_discarded
	move_and_slide(velocity)
