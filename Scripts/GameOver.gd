extends CanvasLayer
@onready var current_score = $VBoxContainer/CurrentScoreLabel
@onready var high_score = $VBoxContainer/HighScoreLabel

var game_scene = preload("res://Scenes/boulder_dash.tscn")

func _on_restart_pressed():
	get_tree().change_scene_to_packed(game_scene)

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _ready():
	current_score.text = "Current Score: %dm" % SaveSystem.current_depth
	high_score.text = "Highscore: %dm" % SaveSystem.high_score
