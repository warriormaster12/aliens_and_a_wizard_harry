extends KinematicBody2D
class_name BaseEnemy

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var health = 100
export var movement_speed = 200
export var acceleration = 5
export var attack_range = 10


export (PackedScene) var spell

var target_pos = Vector2(0,0)
var velocity: Vector2

func _init(_health = 100, _movement_speed = 200, _acceleration = 5):
	health = _health
	movement_speed = _movement_speed
	acceleration = _acceleration
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
