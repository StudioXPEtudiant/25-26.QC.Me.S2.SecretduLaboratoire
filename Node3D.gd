extends Node3D

class_name WorldPosManager

@export var Camera:Camera3D

func _ready():
	if Camera == null: Camera = get_viewport().get_camera_3d()

func getCurrentCursorWorldPos():
	return getCursorWorldPos(Camera.get_viewport().get_mouse_position())

func getCursorWorldPos(posScreen):
	var space_state = Camera.get_world_3d().direct_space_state
	var origin= Camera.project_ray_origin(posScreen)
	var end=origin+ Camera.project_ray_normal(posScreen)*1000.0
	var query:PhysicsRayQueryParameters3D = PhysicsRayQueryParameters3D.create(origin, end)
	query.collide_with_bodies = true
	query.collision_mask=0x80000000

	var result:Dictionary = space_state.intersect_ray(query)
	if result.is_empty():
		return null
		return result.position
func getBodyOnWorldOnCurssor(mask=0x00000001):
	return getBodyOnWorld(Camera.get_viewport().get_mouse_position(),mask)

func getBodyOnWorld(posScreen,mask=0x00000001):
	var space_state = get_world_3d().direct_space_state
	var origin= Camera.project_ray_origin(posScreen)
	var end=origin+ Camera.project_ray_normal(posScreen)*1000
	var query:PhysicsRayQueryParameters3D = PhysicsRayQueryParameters3D.create(origin, end)
	query.collide_with_bodies = true
	query.collision_mask=mask
	var result:Dictionary = space_state.intersect_ray(query)
	if result.is_empty():
		return null
		return result.collider

func getObjectWithMetaTag(node:Node,tag:String,_isActif:bool=true):
	var ElementToPush=node
	var toCheck=node
	var found=false
	while (toCheck!=null&&!found):
		if toCheck.has_meta(tag):
			if toCheck.get_meta(tag):
				ElementToPush=toCheck
				found=true
				toCheck=toCheck.get_parent()
				if !found:
					ElementToPush=null
					return ElementToPush
