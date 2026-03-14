extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

const SPEED = 50

func _process(delta: float) -> void:
	position.x -= SPEED * delta
	
	if position.x < -50:
		queue_free()

func _on_body_entered(_body: Node2D) -> void:
	Global.add_score()
	animation_player.play("pickup")
