extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


const SPEED = 170.0
const JUMP_VELOCITY = -350.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	
	#get the direction, -1 is left
	
	if is_on_floor():
		#flip the sprite based on whether the player hits left or right
		
		if direction > 0:
			animated_sprite.flip_h = false
		elif direction < 0:
			animated_sprite.flip_h = true
			
		#play animations based on the direction
		if direction ==0:
			animated_sprite.play('idle')
		else:
			animated_sprite.play('move')
			
		velocity.x = direction * SPEED
		
		
	elif not is_on_floor():
		if direction > 0:
			animated_sprite.flip_h = false
		elif direction < 0:
			animated_sprite.flip_h = true
		velocity.x = direction * SPEED
		animated_sprite.play('roll')
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
