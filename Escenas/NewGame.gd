extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Fondo/LoadGame.connect("pressed", self, "LoadGame")
	$Fondo/Back.connect("pressed", self, "Back")
	pass 

func NewGame():
	get_tree().change_scene("res://Escenas/Prime_nivel.tscn")
	pass

func LoadGame():
	get_tree().change_scene("res://Escenas/CinematicaInicio.tscn")
	pass
	
func Back():
	get_tree().change_scene("res://Escenas/Main.tscn")
	pass
