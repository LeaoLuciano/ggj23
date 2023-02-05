extends Node2D

@export var level := 0 : set = change_level 

var current_level := $Level0 

var trunks = 0

var limit_roots = 0
var roots := 0

var limit_leaves = 0
var leaves := 0


func _ready():
	for child in get_children():
		child.propagate_call("disable")
	_change_level(level)

func _process(delta):
	pass
	
func can_add_root() -> bool:
	return trunks >= 1
	return roots < limit_roots
	
func can_add_leaf() -> bool:
	print("ADD???")
	return trunks >= 1	
	return leaves < limit_leaves and trunks >= 1



func add_root():
	if can_add_root():
		if roots >= limit_roots:
			upgrade_root()
			return
		roots += 1
		var root = current_level.get_node("root" + str(roots))
		var up = root.get_node("Upgradable")
		up.level = 0
		root.visible = true
		root.propagate_call("enable", [])

func add_leaf():
	if can_add_leaf():
		if leaves >= limit_leaves:
			upgrade_leaf()
			return
		leaves += 1
		var leaf = current_level.get_node("leaf" + str(leaves))
		var up = leaf.get_node("Upgradable")
		up.level = 0
		leaf.visible = true
		leaf.propagate_call("enable", [])	
	
func upgrade():
	level += 1
	print(level)

func upgrade_root():
	_upgrade("root")

func upgrade_leaf():
	_upgrade("leaf")
	
func _upgrade(type : String):
	var item = null
	for child in current_level.get_children():	
		if str(child).find(type) != -1:
			if item == null or child.get_node("Upgradable").level < item.get_node("Upgradable").level:
				item = child
	item.propagate_call("upgrade")
	item.get_node("Upgradable").level += 1
	

func change_level(_level : int) -> int:
	level = _level
	call_deferred("_change_level", _level)
	return _level

func _change_level(_level : int):
	if _level > 2:
		return
#	disable_all()
#	for child in get_children():
#		child.visible = false
	match _level:
		0:
			trunks = 0
			limit_roots = 0
			limit_leaves = 2
			current_level = $Level0
			$Level0.visible = true
		1:
			limit_roots = 3
			trunks = 1
			current_level = %Level1
			get_node("Level1").visible = true
		2:
			limit_roots += 2 
			limit_leaves += 2
			$"Level1/leaf1".position.y -= 80.0
			$"Level1/leaf2".position.y -= 80.0
			$"Level1/trunk".visible = false
			for child in $Level2.get_children():
				get_node("Level2").remove_child(child)
				get_node("Level1").add_child(child)
				
				
#			var trunk = trunk_scn.instantiate()
#			$Core.add_child(trunk)
			
	
	return _level

func disable_all():
	propagate_call("disable", [])

func aaa():
	add_root()
