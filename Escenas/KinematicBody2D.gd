extends KinematicBody2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	var movement = Vector2.ZERO;
	
	if(Input.is_key_pressed(KEY_RIGHT)):
		movement.x = 5;
	if(Input.is_key_pressed(KEY_LEFT)):
		movement.x = -5;
	if(Input.is_key_pressed(KEY_UP)):
		movement.y = -5;
	if(Input.is_key_pressed(KEY_DOWN)):
		movement.y = 5;
	
	move_and_collide(movement)
	
	pass
