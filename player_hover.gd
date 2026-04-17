extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $Sprite

const SPEED := 100.0

func _process(delta: float) -> void:
	rotation = velocity.y / Global.ROTA
	
	if not is_on_floor():
		velocity += (get_gravity()/2) * delta
	
	if Input.is_action_pressed("jump"): velocity -= (get_gravity()) * delta
	
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if velocity.x < 0: 
		sprite.flip_h = true
		rotation = -(velocity.y / Global.ROTA)
	else: 
		sprite.flip_h = false
	
	move_and_slide()
