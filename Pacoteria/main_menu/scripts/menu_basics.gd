extends Control

func _ready():
	var audio_bus_id = AudioServer.get_bus_index("Music")
	AudioPlayer._play_all_music(AudioServer.get_bus_volume_db(audio_bus_id))
