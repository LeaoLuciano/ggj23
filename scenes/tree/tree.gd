extends Node2D

@export var level := 0 : set = change_level 

func _ready():
	pass

func _process(delta):
	pass
	
func add_root():
	pass
	
func add_leaf():
	pass

func change_level(_level : int) -> int:
	for child in get_children():
		child.visibie = false
	match _level:
		0:
			$"Level 0".visible = true
		1:
			$"Level 1".visible = true
#		2:
#			var trunk = trunk_scn.instantiate()
#			$Core.add_child(trunk)
			
	
	return _level

