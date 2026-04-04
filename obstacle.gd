extends Area2D

var SPEED := 80.0
# Have to have big map edge so it doesnt get destroyed before death timer goes off
const MAP_EDGE_LEFT = -320

func _process(delta: float) -> void:
	position.x -= SPEED * delta
	
	if position.x < MAP_EDGE_LEFT:
		queue_free()
