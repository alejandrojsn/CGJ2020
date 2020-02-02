extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Fondo/NewGame.connect("pressed", self, "NewGame")
	$Fondo/Options.connect("pressed", self, "Options")
	$Fondo/About.connect("pressed", self, "About")


func NewGame():
	get_tree().change_scene("res://Escenas/NewGame.tscn")
	pass


func Options():
	get_tree().change_scene("res://Escenas/Options.tscn")
	pass


func About():
	get_tree().change_scene("res://Escenas/About.tscn")
	pass
