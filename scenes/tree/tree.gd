extends Node2D

@export var level := 0 : set = change_level 
@export var seed_scn : PackedScene
@export var trunk_scn : PackedScene

@export var root_scn : PackedScene
@export var leaf_scn : PackedScene

func _ready():
	pass

func _process(delta):
	pass
	
func add_root():
	pass
	
func add_leaf():
	pass

func change_level(_level : int) -> int:
	for child in $Core.get_children():
		$Core.remove_child(child)
	match _level:
		0:
			$Core.add_child(seed_scn.instantiate())
		1:
			var trunk = trunk_scn.instantiate()
			$Core.add_child(trunk)
#		2:
#			var trunk = trunk_scn.instantiate()
#			$Core.add_child(trunk)
			
	
	return _level

