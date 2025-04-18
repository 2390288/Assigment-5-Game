extends GPUParticles2D

func _ready():
	emitting = true
	await get_tree().create_timer(lifetime * 2)
	queue_free()
