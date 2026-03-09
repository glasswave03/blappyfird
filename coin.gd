extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var game_manager: Node = get_tree().root

const SPEED = 50

func _process(delta: float) -> void:
	position.x -= SPEED * delta
	
	if position.x < -50:
		queue_free()

func _on_body_entered(_body: Node2D) -> void:
	game_manager.add_score()
	animation_player.play("pickup")
