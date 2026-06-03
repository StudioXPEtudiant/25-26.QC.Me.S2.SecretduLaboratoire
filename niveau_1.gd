extends Node2D

var image_curseur = preload("res://Screenshot 2026-05-27 191539 - Copie (2).png")

func _ready():
	var img = image_curseur.get_image()
	img.resize(70, 70) # Changez 24 par la taille voulue
	
	var nouvelle_texture = ImageTexture.create_from_image(img)
	Input.set_custom_mouse_cursor(nouvelle_texture)

func _exit_tree():
	Input.set_custom_mouse_cursor(null) # Remet le curseur normal en partant
