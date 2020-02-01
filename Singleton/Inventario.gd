extends Node

var inventario = Dictionary();

func anadir(objeto, cantidad = 1):
	if inventario.has(objeto):
		inventario[objeto] += cantidad
	else:
		inventario[objeto] = cantidad

func hay(objeto):
	if inventario.has(objeto):
		return inventario[objeto]
	else:
		return 0

func quitar(objeto, cantidad = 1):
	if inventario.has(objeto):
		inventario[objeto] -= cantidad
		if inventario[objeto] < 0:
			inventario[objeto] = 0 
