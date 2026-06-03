extends Label

var temps:int = 30
var tempstexte:int = 30
#await get_tree().create_timer(30.0).timeout=a utiliser pour le cooldown


func _process(_delta):
	text = str(tempstexte) + "s restantes"



func _on_timer_timeout():
		if temps == 0:
			visible = false
			await get_tree().create_timer(0.1).timeout
			visible = true
		else:
			tempstexte = temps - 1
			await get_tree().create_timer(1.0).timeout
			temps = tempstexte

