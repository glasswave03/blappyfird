extends CharacterBody2D

const SPEED = 100

func _process(delta: float) -> void:
	var direction = get_local_mouse_position()
	velocity = direction * SPEED * delta
	
	move_and_slide()
