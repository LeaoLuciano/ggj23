extends Node

@export var level := 1

func _ready():
	pass # Replace with function body.

func upgrade():
	get_parent().scale *= 1.2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
