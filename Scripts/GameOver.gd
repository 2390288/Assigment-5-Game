extends CanvasLayer

var game_scene = preload("res://Scenes/boulder_dash.tscn")

func _on_restart_pressed():
	get_tree().change_scene_to_packed(game_scene)

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
