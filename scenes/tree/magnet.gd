extends Node

@export var type : Recurso.ResourceType
@export var force := 2.5
@export var delay := 5.0

func _ready():
	pass

func enable():
	Locator.get_world().new_resource.connect(_attract)

func disable():
	Locator.get_world().new_resource.disconnect(_attract)

func _physics_process(delta):
	pass

func upgrade():
	force *= 2.0
	delay /= 2.0

var wait = false

func _attract(resource : Recurso):
	if resource.type != type or wait:
		return
	var dis = (resource.get_parent().global_position - get_parent().global_position).length()
	if resource.source == null or dis < resource.dis:
		resource.source = get_parent().global_position
		resource.dis = dis
		resource.acc = -force * (resource.get_parent().global_position - get_parent().global_position).normalized()
		resource.magnet = self
		call_deferred("set_delay", resource)

func set_delay(resource : Recurso):
	if resource.magnet == self:
		wait = true
		print("A")
		var timer = get_tree().create_timer(delay)
		timer.timeout.connect(func() : self.wait = false; print("B") )


