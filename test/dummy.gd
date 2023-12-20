extends Sprite

var max_hp = 1000
var hp 

func _ready():
	hp = max_hp

func _process(_delta):
	$ProgressBar.max_value = max_hp
	$ProgressBar.value = hp
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
