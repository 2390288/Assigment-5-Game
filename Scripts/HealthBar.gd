extends TextureProgressBar

@onready var player = $"../../MainCharacter"
var tween: Tween

func _ready():
	max_value = player.health
	value = max_value
	player.connect("health_changed", update_health)

func update_health(new_health: int):
	if tween && tween.is_valid():
		tween.kill()
	
	# Directly animate the built-in 'value' property
	tween = create_tween().set_parallel(true)
	tween.tween_property(self, "value", new_health, 0.5)\
		 .set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_SINE)
	
	# Add visual feedback effects
	tween.tween_property($Fill, "modulate:a", 0.5, 0.1)
	tween.tween_property($Fill, "modulate:a", 1.0, 0.4)
	tween.tween_property($Fill, "scale", Vector2(1.1, 1.1), 0.1)
	tween.tween_property($Fill, "scale", Vector2(1, 1), 0.4)
