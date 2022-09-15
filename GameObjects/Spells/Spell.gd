extends Node2D

class_name Spell

var direction:Vector2 setget _set_direction, _get_direction
export (float) var speed = 0.0
export (float) var fire_delay = 0.0 setget ,_get_fire_delay
export (NodePath) var area_node 
export (String) var counter_spell_group = ""
export (float) var damage = 0.0

onready var life_time:Timer = Timer.new()
onready var area: Area2D = get_node(area_node)

var owning_node:Node2D = null setget _set_owning_node,_get_owning_node

signal counter_spell_detected(counter_spell_group, body)

func _get_fire_delay()->float:
	return fire_delay

func _set_direction(value:Vector2):
	direction = value
	
func _get_direction()->Vector2:
	return direction

func _set_owning_node(value:Node2D):
	owning_node = value

func _get_owning_node():
	return owning_node


# Called when the node enters the scene tree for the first time.
func _ready():
	life_time.wait_time = 10.0
	life_time.name = "life time"
	life_time.one_shot = true
	life_time.autostart = true
	life_time.connect("timeout", self, "_on_LifeTime_timeout")
	
	add_child(life_time)
	if area != null: 
		area.connect("area_entered",self, "_area_has_entered")
		area.connect("body_entered", self, "_body_has_entered")

func _on_LifeTime_timeout():
	queue_free()

func _area_has_entered(area):
	if counter_spell_group != "":
		if area.get_parent().is_in_group(counter_spell_group):
			emit_signal("counter_spell_detected", counter_spell_group, area.get_parent())

func _body_has_entered(body):
	if body != owning_node and owning_node != null:
		if body.is_in_group("enemy") and !owning_node.is_in_group("enemy"):
			body._set_health(body._get_health() - damage)
		elif body.is_in_group("player") and !owning_node.is_in_group("player"):
			body._set_health(body._get_health() - damage)
		self.queue_free()

func _physics_process(delta):
	if direction != Vector2.ZERO:
		global_position += _get_direction().normalized() * speed * delta
