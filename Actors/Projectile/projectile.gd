extends Area2D

var velocity = Vector2.ZERO

func _physics_process(delta: float) -> void:
	position += velocity * delta
	
func fire(forward, speed):
	velocity = forward * speed
	look_at(position + forward)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		body.queue_free()
	
	queue_free()
