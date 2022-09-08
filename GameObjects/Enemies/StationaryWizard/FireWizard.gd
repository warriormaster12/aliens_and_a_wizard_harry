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
	attack()
	print(i)
	print("\n")

func attack():
	var target_dir = target().normalized()
	var distance = target().length()
	if(distance < attack_range):
		print("attack")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
