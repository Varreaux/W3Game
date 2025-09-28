extends CharacterBody2D


@export var speed := 100.0
var player = null

func _ready():
	player = get_parent().get_node("Player")  # Adjust path if needed

func _process(delta):
	if player:
		var direction = (player.global_position - global_position).normalized()
		position += direction * speed * delta
		if direction.x < 0:
			$AnimatedSprite2D.flip_h = true  # Flip horizontally when moving left
		else:
			$AnimatedSprite2D.flip_h = false  # Face right
		if direction.length() > 0:
			$AnimatedSprite2D.play("fly")
		else:
			$AnimatedSprite2D.stop()












#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
#
## Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
#
#
#func _physics_process(delta: float) -> void:
	## Add the gravity.
	#if not is_on_floor():
		#velocity.y += gravity * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()
