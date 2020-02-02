extends Position2D

var can_move = true 

func move_to(direction):
	if can_move:
		can_move = false
		var objetivo = direction + global_position
		$Tween.interpolate_property(
				self, #objeto
				"global_position",
				global_position,
				objetivo,
				2,
				Tween.TRANS_LINEAR, #Tipo de la transformacion
				Tween.EASE_IN_OUT, #tipo de ease
				0) #delay 
		$Tween.start()
		yield($Tween, "tween_completed")
		can_move = true 
		
