extends CharacterBody2D


@export var speed := 100.0
var player = null

func _ready():
	player = get_parent().get_node("Player")  # Adjust path if needed

func _physics_process(delta):
	if player:
		var direction = (player.global_position - global_position)
		direction.y = 0  # only move horizontally
		direction = direction.normalized()
		velocity = direction * speed
		move_and_slide()
	
	

#func _process(delta):
	#if player:
		#var direction = (player.global_position - global_position)
		#direction.y = 0  # Lock vertical movement
		#direction = direction.normalized()
		#position += direction * speed * delta
		#if direction.x < 0:
			#$AnimatedSprite2D.flip_h = true  # Flip horizontally when moving left
		#else:
			#$AnimatedSprite2D.flip_h = false  # Face right
		#if direction.length() > 0:
			#$AnimatedSprite2D.play("slither")
		#else:
			#$AnimatedSprite2D.stop()



func _on_hurtbox_body_entered(body: Node2D) -> void:
	print("Entered by:", body.name)
	if body.name == "Player":
		body.die()
		
		
		


func _on_hurtbox_area_entered(area: Area2D) -> void:
	if area.name == "sword":
		queue_free()  # This destroys the door
