extends RigidBody2D

@onready var sprite = $Sprite2D

func _ready():
	if randf() > 0.5:
		sprite.flip_h = true


func _on_body_entered(body):
	print("Collided with: ", body.name, " | Groups: ", body.get_groups())
	if body.is_in_group("player"):
		print("PLAYER HIT!")  # Confirm this appears
		body.take_damage()
	queue_free()
