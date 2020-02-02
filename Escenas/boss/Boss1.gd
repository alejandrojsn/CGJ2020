extends Node2D

func _on_boss_seeker_targeted_player(in_, position_):
	#print(in_, position_)
	if in_:
		player_targeted = true
		last_position = position_
	else:
		player_targeted = false
