extends MeshInstance2D

var cible:Vector2

func _pressed():
	var zone = get_tree().get_first_node_in_group("zone_canon")
	cible = Vector2(get_local_mouse_position())
	if zone != null:
		var clone = duplicate()
		get_tree().root.add_child(clone)
		clone.global_rotation = zone.global_rotation
		clone.global_position = zone.global_position
	else:
		print("Erreur : Impossible de trouver zonecanon. Vérifiez le nom du groupe.")
	


func _process(delta):
	if Input.is_action_just_pressed("cliquegauche"):
		cible = get_global_mouse_position()
		return _pressed()
	if duplicate(true):
		visible = true
		var vitesse = 50.0
		global_position = global_position.move_toward(cible, vitesse * delta)
		print(cible)
# Called when the node enters the scene tree for the first time.

func _ready():
	pass # Replace with function body.


