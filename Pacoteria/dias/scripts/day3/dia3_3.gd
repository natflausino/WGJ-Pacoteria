extends Node2D

@onready var character_sprite = $Character/Avatar
@onready var puzzle: Panel = $Puzzle
@onready var caixa: TextureRect = $caixa1
@onready var button: Button = $caixa1/button_caixa1

var character_sprites = {
	"Maromba": preload("res://dias/assets/characters/Maromba.png"),
	"Chefe": preload("res://dias/assets/characters/Chefe.png"),
}

func _ready():
	$MadTalk.start_dialog("dialogue_day3", 3)
	$MadTalk.connect("speaker_changed", Callable(self, "_on_speaker_changed"))

func _input(event):
	if (
		(event is InputEventMouseButton) and (event.pressed) and (event.button_index == MOUSE_BUTTON_LEFT)
	):
		$MadTalk.dialog_acknowledge()

func _on_speaker_changed(prev_id, prev_var, new_id, new_var):
	update_character_sprite(new_id)

func update_character_sprite(speaker_name: String):
	if character_sprites.has(speaker_name):
		character_sprite.texture = character_sprites[speaker_name]

	if character_sprite.texture:
		character_sprite.queue_redraw()

	await get_tree().process_frame
	character_sprite.texture = character_sprite.texture

	if character_sprites.has(speaker_name):
		if character_sprites.has(speaker_name):
			character_sprite.texture = character_sprites[speaker_name]
		else:
			character_sprite.texture = null
