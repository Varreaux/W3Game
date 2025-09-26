extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@export var bullet_scene: PackedScene

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var facing_dir := Vector2.RIGHT  # Default direction

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if Input.is_action_pressed("ui_right"):
		facing_dir = Vector2.RIGHT
	elif Input.is_action_pressed("ui_left"):
		facing_dir = Vector2.LEFT
	
	if Input.is_action_just_pressed("ui_accept"):  # space key by default
		var bullet = bullet_scene.instantiate()
		bullet.global_position = global_position
		bullet.direction = facing_dir.normalized()
		get_tree().current_scene.add_child(bullet)
