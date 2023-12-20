extends CanvasLayer

signal spellCast(id)

func _on_spell_pressed(id):
	emit_signal("spellCast",id)
	print(id)
