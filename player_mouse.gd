extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $Sprite

const SPEED := 100.0

func _process(delta: float) -> void:
	rotation = velocity.y / Global.ROTA
	
	
	var direction = get_local_mouse_position()
	velocity = direction * SPEED * delta
	if velocity.x < 0: 
		sprite.flip_h = true
		rotation = -(velocity.y / Global.ROTA)
	else: 
		sprite.flip_h = false
	
	move_and_slide()
