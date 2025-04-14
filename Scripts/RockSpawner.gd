extends Node2D

var falling_rock_scene: PackedScene = preload("res://Scenes/falling_rock.tscn")

@onready var rocks_node = $"../FallingRocks"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func spawn_rock():
	var new_rock = falling_rock_scene.instantiate()
	new_rock.position = position
	rocks_node.add_child(new_rock)


func _on_timer_timeout():
	spawn_rock()
