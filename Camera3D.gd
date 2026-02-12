extends Camera3D

@export var cameraSpeed=1.5

#Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


#Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("forward"):
		position.x-=cameraSpeed*delta
	if Input.is_action_pressed("back"):
		position.x+=cameraSpeed*delta
	if Input.is_action_pressed("left"):
		position.z+=cameraSpeed*delta
	if Input.is_action_pressed("right"):
		position.z-=cameraSpeed*delta
	pass
