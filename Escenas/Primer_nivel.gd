extends Node2D

func _ready():
	Dialogo.mostrar('Test', 'Lorem ipsum dolor sit amet')
	pass

func _input(event):
	if Input.is_key_pressed(KEY_E):
		Dialogo.mostrar("YESS", "Lorem ipsum dolor sit amet constrecteur asasfsgfdggdhdfhg")
