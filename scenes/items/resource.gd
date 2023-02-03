class_name Recurso extends Node

enum ResourceType{
	Nutrient
}

signal add_resource(amount : int)
@export var type := ResourceType.Nutrient


func _ready():
	add_to_group(str(type))
	for counter in Locator.get_counters(type):
		counter.connect_resource(self)

func _process(delta):
	pass

func add(amount : int):
	add_resource.emit(amount)
	
