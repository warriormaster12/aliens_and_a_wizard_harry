extends BaseEnemy


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var i = 1;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _physics_process(delta):
	i = i + 1
	print(i)
	print("\n")
	
	var target_dir = target().normalized()
	var distance = abs(target().length())
	if(distance < attack_range):
		if $FireDelay.time_left <= 0:
			$FireDelay.start()
	else:
		$FireDelay.stop()

func attack():
	if spell != null:
		var spell_inst:Spell = spell.instance()
		spell_inst._set_direction(target() - self.position)
		
		get_tree().current_scene.add_child(spell_inst)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_FireDelay_timeout():
	attack()
