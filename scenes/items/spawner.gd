extends Node

@export var scene : PackedScene 
@export var area : Rect2
@export var spawn_time : int
@export var despawn_time : int
var scene_instance

func _on_timer_timeout():
	
	var pos_x = randf() * (area.size[0]) + area.position[0]
	var pos_y = randf() * (area.size[1]) + area.position[1]
	
	#print(pos_x, pos_y)
	
	var scene_instance = scene.instantiate()
	scene_instance.position = Vector2(pos_x, pos_y)
	Locator.get_simulation().add_child(scene_instance)
	
	#Tempo para spawnar aleatório
	$Spawn.wait_time = randf() * (spawn_time - 1) + 1
	#print($Spawn.wait_time)]
	$Despawn.wait_time = despawn_time


func _on_despawn_timeout():
	print(get_tree())

