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
	body._set_direction(-body._get_direction())
	body._set_owning_node(_get_owning_node())
	body.speed *= 0.9
	self.queue_free()
