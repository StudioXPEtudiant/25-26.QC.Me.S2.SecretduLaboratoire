extends Node2D

var cursoposition:Vector2
var stop:bool=false

func _stop():
	stop = true

# Called when the node enters the scene tree for the first time.
func _process(_delta):
	if stop == false:
		cursoposition = get_global_mouse_position()
		look_at(cursoposition)
#551

# Called every frame. 'delta' is the elapsed time since the previous frame.
