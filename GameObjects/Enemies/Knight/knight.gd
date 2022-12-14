extends BaseEnemy


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	var direction = target().normalized()
	velocity = lerp(velocity, movement_speed * direction, acceleration * delta)
	velocity = move_and_slide(velocity)
