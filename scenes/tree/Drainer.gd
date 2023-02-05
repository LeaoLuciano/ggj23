extends Node

@export var type : Recurso.ResourceType
@export var consume_time := 1.0

var parent : Area2D
@export var enabled := true
func _ready():
	parent = get_parent()
	if enabled:
		parent.connect("area_entered", _drain)

func enable():
	enabled = true
	parent.connect("area_entered", _drain)
	
func disable():
	print("Disabled")
	enabled = false
	parent.disconnect("area_entered", _drain)
	
func _drain(area : Area2D):
	if not enabled:
		return
	for child in area.get_children():
		if child is Recurso and child.type == type:
			child.consume(consume_time)
		
