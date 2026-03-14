extends Area2D

const SPEED = 50
const MAP_EDGE_LEFT = -80

func _process(delta: float) -> void:
	position.x -= SPEED * delta
	
	if position.x < MAP_EDGE_LEFT:
		queue_free()
