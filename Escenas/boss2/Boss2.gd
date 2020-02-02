extends Node2D

class_name Boss

func _on_boss_seeker_targeted_player(in_, position_):
	#print(in_, position_)
	if in_:
		var player_targeted = true
		var last_position = position_
	else:
		var player_targeted = false
