extends Node2D

var cursopposition:float
var cursoposition:Vector2
var cursorposition:float
var cannonposition:float = 0.0
var anglederotation:float
# Called when the node enters the scene tree for the first time.
func _process(_delta):
	cursoposition = get_local_mouse_position()
	cursorposition = cursoposition.x
	cursopposition = cursoposition.y
	rotate_toward(cursopposition,cursorposition,cannonposition) 
	anglederotation = (rotate_toward(cursorposition,cursopposition,cannonposition))
#551

# Called every frame. 'delta' is the elapsed time since the previous frame.
