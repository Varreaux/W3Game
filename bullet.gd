extends Area2D

@export var speed := 600.0
var direction := Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("bullets")
	#name = "bullet"
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed * delta
	#pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "turret":
		body.slow_down()
		queue_free()
	if body.name == "Player":
		body.die()  # Call the player's die function
		queue_free()
