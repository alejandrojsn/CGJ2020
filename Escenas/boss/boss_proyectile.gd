extends Area2D

var velocity = Vector2.ZERO

func _physics_process(delta):
	position +=  velocity * delta

func _on_boss_proyectile_body_shape_entered(body_id, body, body_shape, area_shape):
	
	if body is modojugador:
		body._on_hurt()
	
	queue_free()
	pass # Replace with function body.
