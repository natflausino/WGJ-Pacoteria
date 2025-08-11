extends HSlider

@export var audio_bus_name: String

var audio_bus_id

func _ready():
	audio_bus_id = AudioServer.get_bus_index(audio_bus_name)

func _on_audio_value_changed(value: float):
	var db = linear_to_db(value)
	AudioServer.set_bus_volume_db(audio_bus_id, db)
	if audio_bus_name == "Music":
		AudioPlayer._play_all_music(db)
