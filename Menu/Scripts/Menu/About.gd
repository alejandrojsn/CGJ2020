extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Back.connect("pressed", self, "Back")
	pass 


func Back():
	get_tree().change_scene("res://Scenes/Menu/Main.tscn")
	pass
