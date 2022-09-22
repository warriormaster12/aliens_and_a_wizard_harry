extends Spell
#angle in degrees
var spli_angle = 20
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("counter_spell_detected", self, "_on_counter_spell_detected")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_counter_spell_detected(_counter_spell_group, body):
	body.queue_free()
	#todo: figure out a way to split rocks in half properly
	for i in [0,1,2]:
		var rock:Spell = load("res://GameObjects/Spells/RockBall.tscn").instance()
		var dir_x = self._get_direction().x*cos(-deg2rad(spli_angle)+(i*deg2rad(spli_angle)))-self._get_direction().y*sin(-deg2rad(spli_angle)+(i*deg2rad(spli_angle)))
		var dir_y = self._get_direction().x*sin(deg2rad(spli_angle)+(i*deg2rad(spli_angle)))+self._get_direction().y*cos(-deg2rad(spli_angle)+(i*deg2rad(spli_angle)))
		rock._set_direction(Vector2(dir_x, dir_y))
		rock.position = self.position
		
		get_tree().current_scene.add_child(rock)
