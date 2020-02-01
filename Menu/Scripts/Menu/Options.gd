extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Audio.connect("pressed", self, "Audio")
	$Video.connect("pressed", self, "Video")
	$Back.connect("pressed", self, "Back")
	pass 


func Audio():
	pass

func Video():
	pass

func Back():
	get_tree().change_scene("res://Scenes/Menu/Main.tscn")
	pass
