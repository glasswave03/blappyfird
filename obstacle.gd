extends Area2D

const SPEED = 50

func _process(delta: float) -> void:
	position.x -= SPEED * delta
	
	if position.x < -50:
		queue_free()
