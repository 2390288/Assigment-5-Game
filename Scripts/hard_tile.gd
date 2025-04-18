extends StaticBody2D

var is_active = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_breakable_area_body_entered(body):
	if not is_active:
		return
	is_active = true
	var tween = create_tween()
	tween.tween_property($Sprite2D, "modulate", Color8(255,255,255,0), 1)
	tween.tween_callback(remove)
	body.queue_free()
	
func remove():
	queue_free()
	
