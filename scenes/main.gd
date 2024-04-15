extends Node2D

@export var player_scene: PackedScene
@onready var players: Node2D = $Players
@onready var player_a = $"Node2D/Player A"
@onready var player_b = $"Node2D/Player B"
@onready var Echo: Node2D = $Echo

func _ready() -> void:
	for player_data in Game.players:
		var player = player_scene.instantiate()
		players.add_child(player)
		player.setup(player_data)
		if player_data.role == Statics.Role.ROLE_A:
			player.global_position = player_a.global_position
		if player_data.role == Statics.Role.ROLE_B:
			player.global_position = player_b.global_position
		
		player.fired.connect(_on_player_fired)
		player.fired2.connect(_on_player_fired2)
		


func _on_player_fired(noise) -> void:
	Echo.add_child(noise, true)
	
	
func _on_player_fired2(bullet) -> void:
	Echo.add_child(bullet, true)
		
		
