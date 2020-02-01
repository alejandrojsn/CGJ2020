extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var Velocidad
var Movimiento = Vector2()
var limite
#var bala = preload("res://Sprites/Jugador/pjfrente.png")


# Called when the node enters the scene tree for the first time.
func _ready():
	if not Movimiento:
		$Sprite.animation = "frente"	
	limite = get_viewport_rect().size

#func _ready(): #pass # Replace with function body.
	#limite = get_viewport_rect().size
	
	#if Input. is_action_pressed("fire"):
		#var bala_instance = bala.instance()
		#bala_instance.position = position
		#bala_instance.rotation_degrees = rotation_degrees
		#bala_instance.apply_impulse(Vector2(), Vector2(bala_speed, 0)
		

# Qué quieres que pase cuando el jugador presione una tecla.
# 'delta' is the elapsed time since the previous frame.
func _process (delta):
	Movimiento = Vector2()
	if Input.is_action_pressed("ui_right"):
		Movimiento.x =+ 1
	if Input.is_action_pressed("ui_left"):
		Movimiento.x =- 1
	if Input.is_action_pressed("ui_down"):
		Movimiento.y =+ 1
	if Input.is_action_pressed("ui_up"):
		Movimiento.y =- 1
	if Movimiento.length() > 0: #Verificar si hay movimiento
		Movimiento = Movimiento.normalized() * Velocidad #Normalizar velocidad
		
	if Movimiento.x != 0:
		$Sprite.animation = "lado"
		$Sprite.flip_h = Movimiento.x < 0
	if Movimiento.y < 0:
		$Sprite.animation = "espalda"
	if Movimiento.y > 0:
		$Sprite.animation = "frente"
	
	
		
		#formas erroneas de hacer lo del sprite de lado:
	#if Movimiento.x > 0:
		#$Sprite.animation = "lado"
	#if Movimiento.x < 0:
	#if Input.is_action_pressed("ui_left"): 
	#if Movimiento.x < 0:
		#$Sprite.flip_h = true

		
	position += Movimiento * delta #Que el movimiento no sea eterno
	position.x = clamp(position.x, 0, limite.x) #Limite de la pantalla
	position.y = clamp(position.y, 0, limite.y)
	#position.y = clamp(position.x, 30, limite.y)
	#position.y = clamp(position.y, 30, limite.y)
		
	#if !Movimiento: Otra forma de hacer que mire al frente al final!
		#$Sprite.animation = "frente"
	
	#elif Movimiento.y != 0:
		#$Sprite.flip_v = Movimiento.y > 0 Para juegos de naves!
		
	#else:
		#$Sprite.animation = "frente" Para que siempre vea al frente al final!
