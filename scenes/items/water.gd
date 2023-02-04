extends Area2D

@export var g := Vector2(0, 40)
var velocity = Vector2()

func _ready():
	pass


func _physics_process(delta):
	position += velocity * delta
	velocity += g * delta


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		$Resource.add(1)
		queue_free()
