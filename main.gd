extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(2.0).timeout  # waits 2 seconds
	$TutorialLabel.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#var spawn_position: Vector2z

func _on_checkpoint_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.spawn_position = body.global_position
		$CheckpointLabel.visible = true
		await get_tree().create_timer(2.0).timeout  # waits 2 seconds
		$CheckpointLabel.visible = false
		print("Checkpoint reached!")
