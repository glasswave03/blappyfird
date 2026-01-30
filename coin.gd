extends Area2D

@onready var user_interface: Control = $"../UserInterface"
@onready var animation_player: AnimationPlayer = $AnimationPlayer

const SPEED = 50

func _process(delta: float) -> void:
	position.x -= SPEED * delta
	
	if position.x < -50:
		queue_free()

func _on_body_entered(_body: Node2D) -> void:
	user_interface.add_score()
	animation_player.play("pickup")
