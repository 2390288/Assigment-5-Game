extends Node2D

@onready var left_limit = $FloorLimitLeft
@onready var right_limit = $FloorLimitRight
@onready var hard_tiles_node = $"../../HardTiles"
@onready var floor_spawner_location = $"../FloorSpawnerYPosition"

var floor_tile_scene: PackedScene = preload("res://Scenes/hard_tile.tscn")
var max_tile_quantity = 300;
const tile_size = 32

var spawn_next_location: float

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_row()
	spawn_row()
	spawn_row()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global_position.y > spawn_next_location:
		spawn_row()

func spawn_row():
	var left_limit_position = left_limit.global_position
	var right_limit_position = right_limit.global_position
	var new_tiles = []
	var new_tile_position = left_limit_position
	while(new_tile_position.x < right_limit_position.x):
		var new_tile = floor_tile_scene.instantiate()
		new_tile.global_position = new_tile_position
		new_tile_position.x += tile_size # adjust new tile position
		new_tiles.append(new_tile)
	for i in range(len(new_tiles)):
		if randf() > 0.80:
			# 20% chance of skipping adding the tile
			continue
		hard_tiles_node.add_child(new_tiles[i])
	
	spawn_next_location = global_position.y + tile_size
	
		
