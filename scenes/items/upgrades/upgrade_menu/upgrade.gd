extends Node
class_name Upgrade

@export
var type : String
@export
var production_rate : int
@export
var upgrade_man : Node
@export
var button_text : String
@export
var nutrient_cost : int
@export
var water_cost : int
@export
var sun_cost : int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _process(delta):
	$Button/Sprite2D/Label.text = button_text + "\n" + "N: " + str(nutrient_cost) + " W: " + str(water_cost) + " L: " + str(sun_cost)

func can_buy() -> bool:
	var nutrient_amount = upgrade_man.nutrient_counter.count
	var water_amount = upgrade_man.water_counter.count
	var sun_amount = upgrade_man.sun_counter.count
	if nutrient_amount >= nutrient_cost and water_amount >= water_cost and sun_amount >= sun_cost:
		print("Purchased upgrade " + str(type))
		return true
	else:
		print("Not enough resources")
		return false

func take_resources() -> void:
	upgrade_man.nutrient_counter.count -= nutrient_cost
	upgrade_man.water_counter.count -= water_cost
	upgrade_man.sun_counter.count -= sun_cost
	

func _on_button_pressed() -> void:
	if can_buy():
		take_resources()
		match type:
			"nutrient": upgrade_man.nutrient_spawner.spawn_amount += production_rate
			"water": upgrade_man.cloud_spawner.spawn_amount += production_rate
