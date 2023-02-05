extends Node2D

@export var level := 0 : set = change_level 

var current_level := $Level0 

var limit_roots = 0
var roots := 0


func _ready():
	pass

func _process(delta):
	pass
	
func can_add_root() -> bool:
	return roots < limit_roots

func add_root():
	if roots < limit_roots:
		roots += 1
		current_level.get_node("root" + str(roots)).visible = true
		current_level.propagate_call("enable", [])
		
		
	
func add_leaf():
	pass

func change_level(_level : int) -> int:
	call_deferred("_change_level", _level)
	return _level

func _change_level(_level : int):
	disable_all()
	for child in get_children():
		child.visible = false
	match _level:
		0:
			limit_roots = 0
			current_level = $Level0
			$Level0.visible = true
		1:
			limit_roots = 3
			current_level = %Level1
			get_node("Level1").visible = true
#		2:
#			var trunk = trunk_scn.instantiate()
#			$Core.add_child(trunk)
			
	
	return _level

func disable_all():
	propagate_call("disable", [])
