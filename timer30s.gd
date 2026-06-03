extends Button

var temps:int
#await get_tree().create_timer(30.0).timeout=a utiliser pour le cooldown
func _process(delta):
	await get_tree().create_timer(1.0).timeout
	TextEdit


func _on_timer_timeout():
	pass # Replace with function body.
