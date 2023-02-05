extends Node

@export var type : Recurso.ResourceType
@export var force := 5

func _ready():
	pass

func enable():
	Locator.get_world().new_resource.connect(_attract)

func disable():
	Locator.get_world().new_resource.disconnect(_attract)

func _physics_process(delta):
	pass


func _attract(resource : Recurso):
	if resource.type != type:
		return
	var dis = (resource.get_parent().global_position - get_parent().global_position).length()
	if resource.source == null or dis < resource.dis:
		resource.source = get_parent().global_position
		resource.dis = dis
		resource.acc = -force * (resource.get_parent().global_position - get_parent().global_position).normalized()
	

