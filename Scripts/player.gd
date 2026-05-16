extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@export var animatedSprite: AnimatedSprite2D

func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed('ui_left'):
		animatedSprite.flip_h = true
	if Input.is_action_just_pressed('ui_right'):
		animatedSprite.flip_h = false

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		#animatedSprite.animation = "Run"
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		#animatedSprite.animation = "Idle"
	
	if not is_on_floor():
		velocity += get_gravity() * delta
		#animatedSprite.animation = "Jump"

	move_and_slide()
