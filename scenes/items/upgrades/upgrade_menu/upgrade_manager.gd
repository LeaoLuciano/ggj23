extends Node

@export
var nutrient_counter : Node2D
var nutrient_production_rate : int = 0

@export
var water_counter : Node2D
var water_production_rate : int = 0 

@export
var sun_counter : Node2D
var sun_production_rate : int = 0

@export
var tree : Node2D

@export var nutrient_spawner : Node
@export var cloud_spawner : Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	pass
	#print("Nutrient: " + str(nutrient_counter.count) + " Water: " + str(water_counter.count) + " Sun: " + str(sun_counter.count))
