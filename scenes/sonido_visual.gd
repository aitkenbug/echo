extends Node2D
const lifetime = 0.4
var tiempo = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	tiempo += delta
	if tiempo > lifetime:
		self.queue_free()
	pass
	pass
