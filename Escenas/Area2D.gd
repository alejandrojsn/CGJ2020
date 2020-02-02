extends Area2D

export var direction = Vector2()


onready var cam = get_tree().current_scene.get_node("Cam")


func _on_area_body_entered(body):
	cam.move_to(direction)
