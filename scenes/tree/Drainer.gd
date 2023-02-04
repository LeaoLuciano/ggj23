extends Node

@export var type : Recurso.ResourceType
var parent : Area2D

func _ready():
	parent = get_parent()
	parent.connect("area_entered", _drain)

func _drain(area : Area2D):
	for child in area.get_children():
		if child is Recurso and child.type == type:
			print("PEGOU")
			pass
		
