extends KinematicBody2D
class_name BaseEnemy

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var health:int = 100 setget _set_health, _get_health
export var movement_speed = 200
export var acceleration = 5
export var attack_range = 10


export (PackedScene) var spell

var target_pos = Vector2(0,0)
var velocity: Vector2

func _set_health(value:int):
	health = value
	if health <= 0.0:
		queue_free()

func _get_health()->int:
	return health

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func attack():
	print("Attack not implemented")

func target():
	return (get_parent().get_node("player").position-self.position);
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
