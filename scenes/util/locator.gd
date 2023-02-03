class_name Locator extends Node

func get_world() -> Node:
	return get_tree().get_nodes_in_group("world")[0]
