extends Node2D

onready var texto = $TextureRect/Texto
onready var nombre = $TextureRect/Nombre

func _ready():
	Dialogo.caja_dialogo = self
	hide()
	pass # Replace with function body.

func mostrar(nombre: String, texto: String):
	show()
	self.texto.text = texto
	self.nombre.text = nombre
	
func _input(event):
	if Input.is_key_pressed(KEY_A):
		hide()
