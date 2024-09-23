extends CharacterBody2D

@export var speed = 100.0
@export var jump_velocity = 200.0

func _physics_process(delta: float) -> void:
	#Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	# Horizontal movement
	var direction = Input.get_axis("left", "right")
	velocity.x = direction * speed
	
	# Jumping
	if Input.is_action_just_pressed("jump"):
		velocity.y = -jump_velocity
		
	move_and_slide()
