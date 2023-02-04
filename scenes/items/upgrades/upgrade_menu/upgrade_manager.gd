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

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	nutrient_counter.count += nutrient_production_rate
	water_counter.count += water_production_rate
	sun_counter.count += sun_production_rate
	#print("Nutrient: " + str(nutrient_counter.count) + " Water: " + str(water_counter.count) + " Sun: " + str(sun_counter.count))
