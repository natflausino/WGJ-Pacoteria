extends AudioStreamPlayer

const level_music = preload("res://music/lo-fi-postcard.mp3")

func _play_music(music: AudioStream, volume):
	print(volume)
	stream = music
	volume_db = volume
	play()

func _play_all_music(volume):
	_play_music(level_music, volume)
	
func _play_all_sfx(sfx, volume):
	_play_music(sfx, volume)
