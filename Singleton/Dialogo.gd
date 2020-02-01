extends Node

var caja_dialogo = null setget _set_caja_dialogo

func _set_caja_dialogo(node):
	if is_instance_valid(node):
		caja_dialogo = node

func mostrar(nombre: String, texto: String):
	caja_dialogo.mostrar(nombre, texto)
