extends Area2D

@export var orbit_speed : float
@export var sunbeam_scene : PackedScene
var orbit_radius = 900
var center_point = Vector2(640, 1000)
var angle = 0.0
var delay = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _process(delta):
	look_at(center_point)
	angle += delta * orbit_speed
	var x = center_point.x + orbit_radius * cos(angle)
	var y = center_point.y + orbit_radius * sin(angle)
	if sin(angle) > 0:
		angle += 0.01
	position = Vector2(x, y)
	print(position)

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and delay == false:
		var sunbeam = sunbeam_scene.instantiate()
		sunbeam.position = position
		Locator.get_simulation().add_child(sunbeam)
		delay = true
		$Delay.start()


func _on_delay_timeout():
	delay = false
