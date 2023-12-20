extends Area2D

func _on_hurtBox_area_entered(area):
	get_parent().hp -= area.damage
	get_parent().get_node("Label").show()
	get_parent().get_node("Label").text = str(area.damage)
	yield(get_tree().create_timer(0.2),"timeout")
	get_parent().get_node("Label").hide()
