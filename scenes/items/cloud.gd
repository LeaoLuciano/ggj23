extends Area2D

@export var vel := Vector2(20, 0)
@export var water_scn : PackedScene

var delay = false

func _physics_process(delta):
	position += vel * delta

func _process(delta):
	pass

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and delay == false:
		#print("Chove")
		var water = water_scn.instantiate()
		water.global_position = global_position 
		Locator.get_simulation().add_child(water)
		delay = true
		$Delay.start()


func _on_delay_timeout():
	delay = false
