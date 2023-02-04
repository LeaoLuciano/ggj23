extends Node

@export
var nutrient_counter : Node2D
var nutrient_production_rate : int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	nutrient_counter.count += nutrient_production_rate
	print(nutrient_counter.count)
