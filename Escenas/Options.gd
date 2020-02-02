extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Audio.connect("pressed", self, "Audio")
	$Video.connect("pressed", self, "Video")
	$Back.connect("pressed", self, "Back")
	
	$c_Audio/b_Master_Mute.connect("pressed", self, "Mute_Master")
	$c_Audio/sldr_Master.connect("value_changed", self, "Master_Volume")
	$c_Audio/b_Music_Mute.connect("pressed", self, "Mute_Music")
	$c_Audio/sldr_Music.connect("value_changed", self, "Music_Volume")
	$c_Audio/b_Effects_Mute.connect("pressed", self, "Mute_Effects")
	$c_Audio/sldr_Effects.connect("value_changed", self, "Effects_Volume")
	
	#$c_Video/B_FullScreen.connect("item_selected", self, "Fullscreen")
	
	#$c_Video/B_FullScreen.add_item("Fullscreen", 0)
	$c_Video/B_FullScreen.add_item("Windowed", 0)
	
	"""
	if(Options.fullscreen == true):
		$c_Video/B_FullScreen.select(0)
	elif(Options.res_width == 800 and Options.res_height == 600):
		$c_Video/B_FullScreen.select(1)
	"""
	if(Options.res_width == 800 and Options.res_height == 600):
		$c_Video/B_FullScreen.select(0)
		
	$c_Audio/sldr_Master.set_value(Options.Master_Volume)
	$c_Audio/sldr_Music.set_value(Options.Music_Volume)
	$c_Audio/sldr_Effects.set_value(Options.Effects_Volume)
	
	pass 

func Audio():
	$c_Video.hide()
	$c_Audio.show()
	pass

func Video():
	$c_Video.show()
	$c_Audio.hide()
	pass

func Back():
	$c_Video.hide()
	$c_Audio.hide()
	get_tree().change_scene("res://Escenas/Main.tscn")
	pass

func Fullscreen(aux):
	match aux:
		0:
			Options.fullscreen = true
			Options.resolution()
			Options.save_game()
		1:
			Options.fullscreen = false
			Options.resolution()
			Options.save_game()
	pass

func Mute_Master():
	if (Options.Master_Mute == true):
		Options.Master_Mute = false
	elif (Options.Master_Mute == false):
		Options.Master_Mute = true
	Options.choose_music()
	Options.save_game()
	pass

func Master_Volume(value):
	Options.Master_Volume = $c_Audio/sldr_Master.get_value()
	Options.save_game()
	pass

func Mute_Music():
	if (Options.Mute_Music == true):
		Options.Mute_Music = false
	elif (Options.Mute_Music == false):
		Options.Mute_Music = true
	pass

func Music_Volume(value):
	Options.Music_Volume = $c_Audio/sldr_Music.get_value()
	Options.save_game()
	pass

func Mute_Effects():
	if (Options.Mute_Effects == true):
		Options.Mute_Effects = false
	elif (Options.Mute_Effects == false):
		Options.Mute_Effects = true
	pass

func Effects_Volume(value):
	Options.Effects_Volume = $c_Audio/sldr_Effects.get_value()
	Options.save_game()
	pass
