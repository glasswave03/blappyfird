extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -200.0
const ROTA = 360

@onready var sprite: AnimatedSprite2D = $Sprite
@onready var jump_sfx: AudioStreamPlayer2D = $JumpSFX

func _physics_process(delta: float) -> void:
	# rotate towards y
	rotation = velocity.y / ROTA
	
	# gravity
	if not is_on_floor():
		velocity += (get_gravity()/2) * delta

	# handle jump and dive
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY
		jump_sfx.play(0)
	if Input.is_action_just_pressed("dive"):
		velocity.y = SPEED

	# get input direction and handle movement/deceleration
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	# flip_h depending on direction
	if velocity.x < 0: 
		sprite.flip_h = true
		rotation = -(velocity.y / 360)
	else: 
		sprite.flip_h = false

	move_and_slide()
