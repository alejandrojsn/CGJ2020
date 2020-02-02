extends KinematicBody2D

export (int) var Velocidad
var Movimiento = Vector2()
var limite


func _ready():
	limite = get_viewport_rect().size #Va a tomar el tamaño de la pantalla


func _process(delta):
	Movimiento =  Vector2() #Reiniciar el valor 
	
	if Input.is_action_pressed("ui_right"): #Derecha
		Movimiento.x += 1
	if Input.is_action_pressed("ui_left"): #Izquierda 
		Movimiento.x += -1
	if Input.is_action_pressed("ui_down"): #Abajo
		Movimiento.y += 1
	if Input.is_action_pressed("ui_up"): #Arriba 
		Movimiento.y += -1
	if Movimiento.length() > 0: #Verificar si se esta movimiento 
		Movimiento = Movimiento.normalized() * Velocidad #Normalizar la velocidad
	
	move_and_collide(Movimiento*delta) #Sirve para evitar pasar un objeto por detras
	#position.x = clamp(position.x, 0, limite.x)
	#position.y = clamp(position.y, 0, limite.y)
	
	
	if Movimiento.x != 0: #Al pulsar las flechas entra
		$Sprite_player.animation = "derecha"
		$Sprite_player.flip_h = Movimiento.x < 0
		$Sprite_player.flip_v = false
	elif Movimiento.y < 0:
		$Sprite_player.animation = "espalda"
		$Sprite_player.flip_v = Movimiento.y > 0
	elif Movimiento.y > 0:  #Si no estoy pulsando nada, se queda de frente
		$Sprite_player.animation = "frente"
	else:
		if $Sprite_player.animation == "derecha":
			$Sprite_player.animation = "parado_derecha"
		if $Sprite_player.animation == "espalda":
			$Sprite_player.animation = "parado_espalda"
		if $Sprite_player.animation == "frente":
			$Sprite_player.animation = "parado_frente"
		if $Sprite_player.animation == "parado":
			pass

func _on_Sprite_player_animation_finished():
	pass # Replace with function body.
