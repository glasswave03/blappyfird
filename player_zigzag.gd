extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $Sprite

const SPEED := 150.0

func _process(_delta: float) -> void:
	rotation = velocity.y / Global.ROTA
	
	if Input.is_action_pressed("jump"): velocity.y = -SPEED
	elif Input.is_action_pressed("dive"): velocity.y = SPEED
	else: velocity.y = 0.0
	
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
