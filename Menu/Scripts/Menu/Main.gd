extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$NewGame.connect("pressed", self, "NewGame")
	$Options.connect("pressed", self, "Options")
	$About.connect("pressed", self, "About")


func NewGame():
	get_tree().change_scene("res://Scenes/Menu/NewGame.tscn")
	pass


func Options():
	get_tree().change_scene("res://Scenes/Menu/Options.tscn")
	pass


func About():
	get_tree().change_scene("res://Scenes/Menu/About.tscn")
	pass
