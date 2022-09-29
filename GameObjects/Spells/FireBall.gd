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
	self.scale *= 1.2
	self.damage *= 1.2
	body.queue_free()
