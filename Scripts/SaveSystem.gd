extends Node
var current_depth := 0
var high_score := 0
const SAVE_PATH := "user://highscore.save"

func _ready():
	load_score()

func save_score(score: int):
	current_depth = score 
	if score > high_score:
		high_score = score
		var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
		file.store_32(high_score)

func load_score():
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		high_score = file.get_32()
