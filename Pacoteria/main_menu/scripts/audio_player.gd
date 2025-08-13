extends AudioStreamPlayer

const level_music = preload("res://music/Música de Fundo.mp3")

func _play_music(music: AudioStream, volume):
	stream = music
	volume_db = volume
	play()

func _play_all_music(volume):
	_play_music(level_music, volume)
