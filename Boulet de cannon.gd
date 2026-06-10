extends MeshInstance2D

var cible :Vector2 = Vector2(0, 0)
var est_un_clone : bool = false
var peut_tirer:bool = true

func _pressed():
	var zone = get_tree().get_first_node_in_group("zone_canon")
	if zone != null:
		var clone = duplicate()
		get_tree().root.add_child(clone)
		clone.global_rotation = zone.global_rotation
		clone.global_position = zone.global_position
		clone.est_un_clone = true
		clone.cible = get_global_mouse_position()
	else:
		print("Erreur : Impossible de trouver zonecanon. Vérifiez le nom du groupe.")
	


func _process(delta):
	if Input.is_action_just_pressed("cliquegauche") and peut_tirer and not est_un_clone:
		peut_tirer = false # Bloque les tirs suivants
		_pressed() # Lance le boulet
		await get_tree().create_timer(2.0).timeout # Temps d'attente (1.0 seconde)
		peut_tirer = true # Recharge terminée !
	if est_un_clone == true:
		visible = true
		var vitesse = 500.0
		get_tree().create_timer(0.01).timeout
		global_position = global_position.move_toward(cible, vitesse * delta)
		if cible == global_position:
			queue_free()
		print(cible)
# Called when the node enters the scene tree for the first time.

func _ready():
	pass # Replace with function body.


