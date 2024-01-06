extends Node

@onready var audio_players = get_children()

func _enter_tree():
	AudioServer.add_bus(1)
	AudioServer.add_bus(2)
	AudioServer.set_bus_name(1, "SFX")
	AudioServer.set_bus_name(2, "Music")

func play_sound(sound_name: String, volume_db: float = 0):
	for audio_player in audio_players:
		if !audio_player.playing:
			audio_player.set_bus("SFX")
			audio_player.stream = load("res://Assets/Audio/Sfx/"+sound_name+".wav")
			audio_player.volume_db = volume_db
			audio_player.play()
			break

func play_random_sound(sound_names: Array, volume_db: float = 0):
	for audio_player in audio_players:
		if !audio_player.playing:
			audio_player.set_bus("SFX")
			audio_player.stream = load("res://Audio/Sfx/"+choose(sound_names)+".wav")
			audio_player.volume_db = volume_db
			audio_player.play()
			break

func play_track(track_name: String, volume_db: float = 0):
	for audio_player in audio_players:
		if !audio_player.playing:
			audio_player.set_bus("Music")
			audio_player.stream = load("res://Assets/Audio/Music/"+track_name+".wav")
			audio_player.volume_db = volume_db
			audio_player.play()
			break

func stop_track():
	for audio_player in audio_players:
		if audio_player.get_bus() == "Music":
			audio_player.stop()

func choose(arr: Array):
	randomize()
	arr.shuffle()
	return arr.front()
