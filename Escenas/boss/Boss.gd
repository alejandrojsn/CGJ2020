extends Node2D

var proyectile = preload("res://Escenas/boss/boss_proyectile.tscn")
var PROYECTILE_VELOCITY = 500
var player_targeted = false
var last_position = Vector2.ZERO
var have_ammo = true

func _ready():
	pass
	

"""
Evento: si encuentra al target le dispara.
to FIX: disparar cada cuanto, en vez de cada vez que lo encuentra.
"""
func _on_boss_seeker_targeted_player(in_, position_):
	print(in_, position_)
	if in_:
		player_targeted = true
		last_position = position_
	else:
		player_targeted = false
		
		
func _process(delta):
	if (player_targeted):
		shoot(last_position)
	pass
	
func shoot(position_):
	if have_ammo:
		if (last_position != position_):
			last_position = position_
		wait(0.3)
		var b = proyectile.instance()
		var vector = position_ - position
		var magnitud = sqrt((vector.x * vector.x) + (vector.y * vector.y))
		#b.velocity = ((position_ - position)/ Vector2(sqrt(position_.x * position_.x +  position.x * position.x), sqrt(position_.y * position_.y   position.y * position.y))) * PROYECTILE_VELOCITY
		b.velocity = (vector / magnitud)* PROYECTILE_VELOCITY
		add_child(b)
		have_ammo = false
	
func wait(s):
	var t = Timer.new()
	t.wait_time = s
	t.one_shot = true
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	have_ammo = true
	t.queue_free()
