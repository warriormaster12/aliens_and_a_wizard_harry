extends KinematicBody2D


export (float) var speed = 300.0
export (float) var acceleration = 10.0
export var health:int = 100 setget _set_health, _get_health
export (PackedScene) var spell 

var counter_spell_group: String = ""

var velocity: Vector2

#last direction that the player moved. Useful for determining where to fire projectiles
var look_direction:Vector2

onready var fire_delay:Timer = $FireDelay

func _set_health(value:int):
	health = value
	if health <= 0.0:
		get_tree().reload_current_scene()

func _get_health()->int:
	return health




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	pass

func _process(_delta):
	if Input.is_action_pressed("cast_a_spell") && fire_delay.time_left <= 0.0:
		_cast_a_spell()
	if Input.is_action_just_pressed("spell_1"):
		spell = preload("res://GameObjects/Spells/FireBall.tscn")
	elif Input.is_action_just_pressed("spell_2"):
		spell = preload("res://GameObjects/Spells/AirBall.tscn")
	elif Input.is_action_just_pressed("spell_3"):
		spell = preload("res://GameObjects/Spells/RockBall.tscn")

func _physics_process(delta):
	var direction: Vector2 = Vector2(Input.get_axis("move_l", "move_r"),Input.get_axis("move_u", "move_d"))
	direction = direction.normalized()
	
	var temp_look_direction:Vector2 = Vector2(Input.get_axis("fire_l", "fire_r"),Input.get_axis("fire_u", "fire_d"))
	if temp_look_direction != Vector2.ZERO:
		look_direction = temp_look_direction
		look_direction = look_direction.normalized()
	else:
		look_direction = Vector2(0,1)
	
	
	velocity = lerp(velocity, speed * direction, acceleration * delta)
	
	velocity = move_and_slide(velocity)

func _cast_a_spell():
	if spell != null:
		var spell_inst:Spell = spell.instance()
		fire_delay.wait_time = spell_inst._get_fire_delay()
		spell_inst._set_direction(look_direction)
		spell_inst._set_owning_node(self)
	
		spell_inst.position = self.position
		
		get_tree().current_scene.add_child(spell_inst)
		fire_delay.start()
	


func _on_FireDelay_timeout():
	pass # Replace with function body.
