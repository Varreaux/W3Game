extends StaticBody2D

var open_y
var closed_y
var is_open = true
var speed = 500     # Pixels per second
var going_up = true			# whether the door is currently opening

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	open_y = self.global_position[1]-75  # How far up the door slides
	closed_y = self.global_position[1]    # Starting position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if going_up:
		position.y -= speed * delta
		if position.y <= open_y:
			going_up = false
	else:
		position.y += speed * delta
		if position.y >= closed_y:
			going_up = true
	

func _on_hit_box_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullets"):
		area.queue_free()
		speed *= 0.5
		$Sprite2D.modulate = Color(1, 1.5, 0.5)  # Tint green
		await get_tree().create_timer(0.2).timeout
		$Sprite2D.modulate = Color(1, 1, 1)  # Back to normal
