extends Area2D

@export var velocity : float
var tree_pos = Vector2(640,480)#Deve ter um jeito melhor de pegar essa info 

func _ready():
	pass


func _process(delta):
	look_at(tree_pos)
	var direction = (tree_pos - position).normalized()
	position += direction * velocity
	if (position - tree_pos).length() < 2:
		queue_free()
