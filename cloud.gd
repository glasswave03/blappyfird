extends Node2D

var speed: float

func _process(delta: float) -> void:
	position.x -= speed * delta
