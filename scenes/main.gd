extends Node2D

@export var player_scene: PackedScene
@onready var players: Node2D = $Players
@onready var player_a = $"Node2D/Player A"
@onready var player_b = $"Node2D/Player B"
@onready var Echo: Node2D = $Echo

@export var echo_scene: PackedScene


func _ready() -> void:
	for player_data in Game.players:
		var player = player_scene.instantiate()
		players.add_child(player)
		player.setup(player_data)
		if player_data.role == Statics.Role.ROLE_A:
			player.global_position = player_a.global_position
		if player_data.role == Statics.Role.ROLE_B:
			player.global_position = player_b.global_position
		
	#for player in players.get_children():
		#Debug.log(player.name)

var num_particles = 16

func _physics_process(delta):
	for player in players.get_children():
		if player.noise_signal==1:
			player.noise_signal = 0
			for k in range(num_particles):
				var echo_inst = echo_scene.instantiate()
				echo_inst.global_rotation = k*2*PI/num_particles
				echo_inst.global_position = player.global_position
				Echo.add_child(echo_inst, true)
