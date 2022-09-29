tool
extends Particles2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _get(_property):
	for i_child in get_children():
		if i_child is Particles2D:
			if i_child.emitting != emitting:
				i_child.emitting = emitting
			if i_child.one_shot != one_shot:
				i_child.one_shot = one_shot
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
