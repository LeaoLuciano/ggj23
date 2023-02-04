extends Node

@export
var type : String
@export
var production_rate : int
@export
var upgrade_man : Node
@export
var button_text : String

# Called when the node enters the scene tree for the first time.
func _ready():
	$Button.text = button_text


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed() -> void:
	match type:
		"nutrient": upgrade_man.nutrient_production_rate += production_rate
