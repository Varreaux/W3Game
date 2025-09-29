extends CharacterBody2D

const REGULAR_SPEED := 50.0
const CHASING_SPEED := 100.0
const REDUCED_SPEED := 20.0

@export var speed := REGULAR_SPEED
var player: Node2D
var direction = 1
var _is_slowed := false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_bottom: RayCast2D = $RayCastBottom
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	player = get_parent().get_node("Player")

func _physics_process(delta):
	if ray_cast_right.is_colliding() or not ray_cast_bottom.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding() or not ray_cast_bottom.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	#if player:
		#var dx := player.global_position.x - global_position.x
		#var dir := 0.0
		#if absf(dx) > 0.5:
			#dir = sign(dx)
		
	position.x = direction * speed * delta
	velocity.y += gravity * delta
	move_and_slide()


		#if dir_x != 0.0:
			#$AnimatedSprite2D.flip_h = (dir_x < 0.0)

#func _input(event):
	#if event.is_action_pressed("ui_accept") and not _is_slowed:
		#_temp_slow(1.0)
#
#func _temp_slow(duration: float) -> void:
	#_is_slowed = true
	#var old := speed
	#speed = REDUCED_SPEED
	#await get_tree().create_timer(duration).timeout
	#speed = old
	#_is_slowed = false
