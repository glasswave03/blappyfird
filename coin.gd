extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

const MAP_EDGE_LEFT := -80
var SPEED := 80.0

func _process(delta: float) -> void:
	position.x -= SPEED * delta
	
	if position.x < MAP_EDGE_LEFT:
		queue_free()

func _on_body_entered(_body: Node2D) -> void:
	Global.add_score()
	animation_player.play("pickup")
