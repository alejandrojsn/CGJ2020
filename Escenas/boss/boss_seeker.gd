extends Node2D

var NAME_NODE_PLAYER_RB = "KinematicBody2D"


var w = -0.05 # velocidad
var MAX_ANGULO_GIRO : float = 115
var MIN_ANGULO_GIRO = -15

var dex_giro = true # dextro giro
var rotating = true

var bod : KinematicBody2D;

var player_targeted = false
signal targeted_player

var PLAYER_ID

	
func _process(delta):
	if get_parent().target != null && get_parent().get_node(get_parent().target) != null:
		PLAYER_ID = get_parent().get_node(get_parent().target).get_instance_id()
		find_player()
	#print(get_parent().get_node(get_parent().target))


"""
Busca al jugador y lo persigue.
@return posicion_player
"""
func find_player():
	
	var _rotationx = get_node("Boss_sprite").rotation_degrees
	
	# para limitar el maximo angulo de giro, empieza de 0 y se mueve dextro.
	#if _rotationx <= - MAX_ANGULO_GIRO:
	#	dex_giro = false
	#elif _rotationx >= - MIN_ANGULO_GIRO:
	#	dex_giro = true
	
	if (dex_giro):
		w = -abs(w)
	else:
		w = abs(w)

	_ray_cast_duo(NAME_NODE_PLAYER_RB)
	
	_rotatex(w)

func _rotatex(g):
	if rotating:
		get_node("Boss_sprite").rotate(g)
	
func _ray_cast_duo(to_detect):
	var rc1 = get_node("Boss_sprite/RayCast2D").get_collider() #derecha
	var rc2 = get_node("Boss_sprite/RayCast2D2").get_collider() #izq
	
	#if (rc1):
			#print(rc1, rc1.get_instance_id())
	if ( rc1 != null and rc1.get_instance_id() == PLAYER_ID):

		if (rc2 != null and rc2.get_instance_id() == PLAYER_ID):
			rotating = false
			if (dex_giro):
				_emit_targeted_player(true, rc1)
			else:
				_emit_targeted_player(true, rc2)
			return
		elif not rotating:
			dex_giro = true
			_emit_targeted_player(false, rc1)
		rotating = true

	elif (rc2 != null and rc2.get_instance_id() == PLAYER_ID):
		if dex_giro or not rotating:
			_emit_targeted_player(false, rc2)
			dex_giro = false
		rotating = true

func _emit_targeted_player(in_, collider):
	if not player_targeted and in_:
		player_targeted = true
		emit_signal("targeted_player", true, collider.global_transform.origin)
	elif player_targeted and not in_:
		player_targeted = false
		emit_signal("targeted_player", false, collider.global_transform.origin)

func get_player() -> Node:
	return get_node(get_parent().target)
