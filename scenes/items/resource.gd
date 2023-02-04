class_name Recurso extends Node

enum ResourceType{
	Nutrient,
	Water,
	Sun
}

signal add_resource(amount : int)
@export var type := ResourceType.Nutrient
@export var value := 1

var source = null 
var dis = null
var force = null

var vel := Vector2()
var acc := Vector2() 

func _ready():
	add_to_group(str(type))
	for counter in Locator.get_counters(type):
		counter.connect_resource(self)
	get_parent().connect("input_event", _on_input_event)
	Locator.get_world().inform_resource(self)

func _physics_process(delta):
	if source != null:
		get_parent().global_position += vel * delta
		vel += acc * delta 
		

func consume(time : float):
	var tween = self.create_tween()
	get_parent().get_node("CollisionShape2D").disabled = true
	tween.tween_property(get_parent(), "scale", Vector2(0, 0), time)
	tween.tween_callback(_consume)

func _consume():
	add_resource.emit(value)
	get_parent().queue_free()
	
func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		consume(0.0)
