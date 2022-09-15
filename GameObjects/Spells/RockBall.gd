extends Spell


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
	for i in 10:
		var rock:Spell = load("res://GameObjects/Spells/RockBall.tscn").instance()
		rock._set_direction(self._get_direction())
		rock.position = self.position
		rock.position *= 0.01
		get_tree().current_scene.add_child(rock)
