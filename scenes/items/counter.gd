extends Node2D

@export var type := Recurso.ResourceType.Nutrient
@export var count := 0

func _ready():
	add_to_group("counter"+str(type))
	
func connect_resource(resource : Recurso):
	resource.add_resource.connect(Callable(self, "add"))

func _process(delta):
	pass

func add(amount : int):
	print(amount)
	pass
