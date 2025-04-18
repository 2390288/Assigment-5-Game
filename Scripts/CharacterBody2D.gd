extends CharacterBody2D
signal game_over(reason: String)
@onready var animatedSprite = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
signal depth_updated(new_depth: int)

var current_depth := 0
var max_depth := 0
var start_y: float

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_facing_right = true

func _ready():
	start_y = global_position.y

func _physics_process(delta):
	current_depth = int((global_position.y - start_y) / 32 * 3)
	
	if current_depth > max_depth:
		max_depth = current_depth
		emit_signal("depth_updated", max_depth)
		
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	var camera := get_viewport().get_camera_2d()
	var screen_top = camera.global_position.y - get_viewport_rect().size.y/2
	
	if global_position.y < screen_top:
		emit_signal("game_over", "out_of_bounds")
		print("Out of bounds!")  # Debug

func _process(delta):
	animate()
	flip()
	
func animate():
	if not is_on_floor():
		animatedSprite.play("jump")	
	elif abs(velocity.x) > 0.05:
		animatedSprite.play("run")
	else:
		animatedSprite.play("idle")
	
func flip():
	if velocity.x < -0.5 and is_facing_right:
		scale.x *= -1
		is_facing_right = false
	if velocity.x > 0.5 and not is_facing_right:
		scale.x *= -1
		is_facing_right = true	
	
var health := 4
var can_take_damage := true

func take_damage():
	if can_take_damage:
		health -= 1
		if health <= 0:
			emit_signal("game_over", "health_depleted")
		# Add temporary invincibility (we'll implement animation later)
		can_take_damage = false
		await get_tree().create_timer(3.0).timeout
		can_take_damage = true
