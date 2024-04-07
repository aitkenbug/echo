extends CharacterBody2D
class_name Player

var speed = 200
var acceleration = 300


func _physics_process(delta: float)-> void:
	
	if is_multiplayer_authority():
		var move_input_x = Input.get_axis("move_left","move_right")
		var move_input_y = Input.get_axis("move_up","move_down")
		velocity.x = move_toward(velocity.x, move_input_x * speed, acceleration * delta)
		velocity.y = move_toward(velocity.y, move_input_y * speed, acceleration * delta)
		send_data.rpc(global_position)
	move_and_slide()
	
func _input(event: InputEvent)-> void:
	if is_multiplayer_authority():
		if event.is_action_pressed("action"):
			action.rpc()

func setup(player_data: Statics.PlayerData):
	name = str(player_data.id)
	set_multiplayer_authority(player_data.id)
	
@rpc("authority","call_local","reliable")
func action():
	pass

@rpc("authority", "call_local","reliable")
func send_data(pos: Vector2):
	global_position = pos
	
	