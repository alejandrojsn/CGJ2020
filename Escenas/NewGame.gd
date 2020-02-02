extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$LoadGame.connect("pressed", self, "LoadGame")
	$Back.connect("pressed", self, "Back")
	pass 

func NewGame():
	pass

func LoadGame():
	#get_tree().change_scene("res://Escenas/Primer_nivel.tscn")
	pass
	
func Back():
	get_tree().change_scene("res://Escenas/Main.tscn")
	pass
