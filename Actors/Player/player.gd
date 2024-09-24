extends CharacterBody2D

@export var speed = 300.0
@export var jump_velocity = 200.0
@export var projectile_scene: Resource;
@export var projectile_speed = 1000.0

func _physics_process(delta: float) -> void:
	#Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	# Horizontal movement
	var direction = Input.get_axis("left", "right")
	velocity.x = direction * speed
	
	# Jumping
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_velocity
		
	move_and_slide()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		shoot()
	
func shoot():
	var new_projectile = projectile_scene.instantiate()
	get_parent().add_child(new_projectile)
	
	var mouse_direction = (get_global_mouse_position() - position).normalized()
	new_projectile.position = position + (mouse_direction * 32.0)
	
	new_projectile.fire(mouse_direction, projectile_speed)
