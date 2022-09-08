extends Node2D

class_name Spell

var direction:Vector2 setget _set_direction, _get_direction
export (float) var speed = 0.0
export (float) var fire_delay = 0.0 setget ,_get_fire_delay

onready var life_time:Timer = Timer.new()

func _get_fire_delay()->float:
	return fire_delay

func _set_direction(value:Vector2):
	direction = value
	
func _get_direction()->Vector2:
	return direction


# Called when the node enters the scene tree for the first time.
func _ready():
	life_time.wait_time = 10.0
	life_time.name = "life time"
	life_time.one_shot = true
	life_time.autostart = true
	life_time.connect("timeout", self, "_on_LifeTime_timeout")
	
	add_child(life_time)

func _on_LifeTime_timeout():
	queue_free()


func _physics_process(delta):
	if direction != Vector2.ZERO:
		global_position += _get_direction().normalized() * speed * delta
