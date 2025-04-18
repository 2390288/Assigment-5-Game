extends RigidBody2D

@onready var sprite = $Sprite2D

func _ready():
	contact_monitor = true
	max_contacts_reported = 1
	if randf() > 0.5:
		sprite.flip_h = true

var particles_scene = preload("res://Scenes/Rock_particles.tscn")

# FallingRock.gd
func _on_body_entered(body):
	var particles = particles_scene.instantiate()
	# Add to world instead of rock parent
	get_tree().current_scene.add_child(particles)
	particles.global_position = global_position
	particles.emitting = true
	
	if body.is_in_group("player"):
		body.take_damage()
	
	queue_free()
