extends Node2D


@export var sprite2D:

func _ready():
	Sprite2d.angle = get_local_mouse_position("x.position") - 551
	end
