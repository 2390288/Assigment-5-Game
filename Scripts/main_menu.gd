extends Node2D

var game_scene = preload("res://Scenes/boulder_dash.tscn")

func _on_start_game_button_pressed():
	get_tree().change_scene_to_packed(game_scene)


func _on_exit_game_button_pressed():
	get_tree().quit()
