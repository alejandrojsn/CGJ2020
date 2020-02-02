extends Control


# Temporary
const SAVE_PATH = "res://save.json"
var settings = {}

var play_Music = 1
var play_Effects = 1
var new_choice = 1
var song 
var menu = true

# Saved
var Master_Volume = 2000
var Music_Volume = 2000
var Effects_Volume = 2000

var Master_Mute = false
var Music_Mute = false
var Effects_Mute = false

var res_width = 800
var res_height = 600
var fullscreen = false

var sp_use = 32
var sp_pause = 16777217

var ready = true
var ready_timer = 5

#var music = AudioStreamPlayer2D.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	load_game()
	choose_music()
	#resolution()
	pass # Replace with function body.

func _process(delta):
	if (!$music.is_playing()):
		choose_music()
	
	if(Master_Volume > 0 and Music_Volume > 0):
		play_Music = int((Master_Volume / 2000) * (Music_Volume / 2000) * 2000)
	else:
		play_Music = 1
	
	if(Master_Mute == true or Music_Mute == true):
		play_Music = 1
	
	if(Master_Volume > 0 and Effects_Volume > 0):
		play_Effects = int((Master_Volume / 2000) * (Effects_Volume / 2000) * 2000)
	else:
		play_Effects = 1
	
	if(Master_Mute == true or Effects_Mute == true):
		play_Music = 1

	$music.set_max_distance(play_Music)
	pass

func _input(event):
	pass

func choose_music():
	if(menu == true):
		menu_music()
	else:
		game_music()
	pass

func menu_music():
	
	randomize()
	new_choice = int(rand_range(1, 3))
	#new_choice = 1
	match new_choice:
		1:
			song = load("res://Música/Menu/Fanfare Game.wav")
		2:
			song = load("res://Música/Menu/Neon Genesis Evangelion.wav")
		3:
			song = load("res://Música/Menu/Uchiage Hanabi - MIDI.wav")

	
	$music.set_stream(song)
	$music.play(0.0)
	pass

func game_music():
	
	randomize()
	#new_choice = int(rand_range(1, 1))
	
	match new_choice:
		1:
			song = load("res://Música/Game/Alive.wav")
	
	$music.set_stream(song)
	$music.play(0.0)
	pass

"""
func resolution():
	
	ProjectSettings.set_setting("display/window/size/width", res_width)
	ProjectSettings.set_setting("display/window/size/height", res_height)
	OS.set_window_size(Vector2(res_width, res_height))
	
	if(fullscreen == true):
		OS.set_window_fullscreen(false)
		OS.set_window_fullscreen(true)
	elif(fullscreen == false):
		OS.set_window_fullscreen(true)
		OS.set_window_fullscreen(false)
		OS.current_screen = 0;
		OS.set_window_position(Vector2(0,0))
	pass
"""

func save_game():
	var settings = {
		resolution = {width = res_width, height = res_height},
		fullscreen = fullscreen,
		Master_Volume = Master_Volume,
		Master_Mute = Master_Mute,
		Music_Volume = Music_Volume,
		Music_Mute = Music_Mute,
		Effects_Volume = Effects_Volume,
		Effects_Mute = Effects_Mute,
		sp_use = sp_use,
		sp_pause = sp_pause,		
	}
	
	var safe_file = File.new()
	safe_file.open(SAVE_PATH, File.WRITE)
	safe_file.store_line(to_json(settings))
	safe_file.close()
	pass

func load_game():
	var save_file = File.new()
	if(not save_file.file_exists(SAVE_PATH)):
		return
	
	save_file.open(SAVE_PATH, File.READ)
	
	var data = {}
	data = parse_json(save_file.get_as_text())
	
	Master_Volume = data['Master_Volume']
	Music_Volume = data['Music_Volume']
	Effects_Volume = data['Effects_Volume']
	
	Master_Mute = data['Master_Mute']
	Music_Mute = data['Music_Mute']
	Effects_Mute = data['Effects_Mute']
	
	res_width = data['resolution']['width']
	res_height = data['resolution']['height']
	fullscreen = data['fullscreen']
	
	sp_use = data['sp_use']
	sp_pause = data['sp_pause']
	
	pass

