extends RigidBody2D

var speed = 500


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var velocity = speed * transform.x
	position += velocity * delta
	pass
