extends Node

@export var type : Recurso.ResourceType
@export var force := 5

func _ready():
	Locator.get_world().new_resource.connect(_attract)

func _physics_process(delta):
	pass


func _attract(resource : Recurso):
	print("ATRAI")
	if resource.type != type:
		return
	var dis = (resource.get_parent().global_position - get_parent().global_position).length()
	if resource.source == null or dis < resource.dis:
		resource.source = get_parent().global_position
		resource.dis = dis
		resource.acc = -force * (resource.get_parent().global_position - get_parent().global_position).normalized()
		print(resource.acc,  resource.get_parent().global_position,  get_parent().global_position)
	

