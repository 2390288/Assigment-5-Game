extends Node2D
@onready var high_score_label = $CanvasLayer/VBoxContainer/HighScoreLabel
var game_scene = preload("res://Scenes/boulder_dash.tscn")

func _on_start_game_button_pressed():
	get_tree().change_scene_to_packed(game_scene)


func _on_exit_game_button_pressed():
	get_tree().quit()



func _on_english_button_pressed() -> void:
	TranslationServer.set_locale("en")


func _on_french_button_pressed() -> void:
	TranslationServer.set_locale("fr")

func _ready():
	high_score_label.text = "HighScore: %dm" % SaveSystem.high_score

