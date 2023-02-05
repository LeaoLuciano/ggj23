extends Node2D

signal new_resource(resource : Recurso)

func _ready():
	pass # Replace with function body.


func _process(delta):
	pass

func inform_resource(resource : Recurso):
	new_resource.emit(resource)
