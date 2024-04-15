extends Area2D

@onready var sprite_2d = $Sprite2D

var speed = 500
const lifetime = 5
var tiempo = 0
var collision_cnt = 0
var target_angle = 0

func _ready() -> void:
	body_entered.connect(_on_body_entered)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var velocity = speed * transform.x
	position += velocity * delta
	if collision_cnt>1: 
		position += velocity * delta * -1
	tiempo += delta
	if tiempo > lifetime:
		self.queue_free()
	pass


func _on_body_entered(body: Node2D):
	collision_cnt = collision_cnt+1
	Debug.log(collision_cnt)
	if collision_cnt>1:
		if body is CharacterBody2D:
			sprite_2d.modulate = Color.RED	
	
	#if collision_cnt>1:
		#Debug.log(speed * transform.x)
		
	 
		#sprite_player.rotation = lerp(target_angle,sprite_player.rotation,0.5)
		#velocity = velocity.bounce(body.get_normal())*0.9
