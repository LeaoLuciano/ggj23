extends Node

func get_world() -> Node:
	return get_tree().get_nodes_in_group("world")[0]


func get_resources(type : Recurso.ResourceType):
	return get_tree().get_nodes_in_group(str(type))

func get_counters(type : Recurso.ResourceType):
	return get_tree().get_nodes_in_group("counter"+str(type))
