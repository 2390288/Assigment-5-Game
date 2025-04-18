extends Node2D  # Make sure this matches your root node type

# Get reference to player using the correct path
@onready var player = $MainCharacter
@onready var depth_label = $CanvasLayer/DepthLabel  


func _ready():
	if player:
		player.connect("depth_updated", _on_depth_updated)
		player.connect("game_over", _on_game_over)
	else:
		print("Error: Player node not found!")

func _on_depth_updated(new_depth: int):
	depth_label.update_depth(new_depth)  # Direct call

func _on_game_over(reason: String):
	SaveSystem.save_score(player.max_depth)
	get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")
