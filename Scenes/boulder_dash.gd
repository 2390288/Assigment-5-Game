extends Node2D  # Make sure this matches your root node type

# Get reference to player using the correct path
@onready var player = $MainCharacter  # Replace "MainCharacter" with your player node's name

func _ready():
	if player:
		player.connect("game_over", _on_game_over)
	else:
		print("Error: Player node not found!")

func _on_game_over(reason: String):
	get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")
