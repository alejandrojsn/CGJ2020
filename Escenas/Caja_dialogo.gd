extends ColorRect

onready var texto = $Texto
onready var nombre = $Nombre

func _ready():
	Dialogo.caja_dialogo = self
	hide()
	pass # Replace with function body.


