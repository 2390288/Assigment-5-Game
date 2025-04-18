extends RigidBody2D

@onready var sprite = $Sprite2D

func _ready():
	if randf() > 0.5:
		sprite.flip_h = true
