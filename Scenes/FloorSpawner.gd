extends Node2D

@onready var left_limit = $FloorLimitLeft
@onready var right_limit = $FloorLimitRight
@onready var hard_tiles_node = $"../../HardTiles"
@onready var floor_spawner_location = $"../FloorSpawnerYPosition"
var health_potion_scene = preload("res://Scenes/Health_Potion.tscn")

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
	var tile_positions = []  # Track positions explicitly
	var current_pos = left_limit_position
	
	# First pass: collect all potential tile positions
	while current_pos.x < right_limit_position.x:
		tile_positions.append(current_pos)
		current_pos.x += tile_size
	
	# Second pass: decide what to spawn at each position
	for pos in tile_positions:
		if randf() > 0.80:  # 20% gap chance
			if randf() < 0.10:  # 10% of gaps get potions
				var potion = health_potion_scene.instantiate()
				potion.global_position = pos
				
				# Add to same parent as rocks for proper positioning
				hard_tiles_node.get_parent().call_deferred("add_child", potion)
			continue
			
		# Add regular tile
		var new_tile = floor_tile_scene.instantiate()
		new_tile.global_position = pos
		hard_tiles_node.add_child(new_tile)
	
	spawn_next_location = global_position.y + tile_size
	
		
