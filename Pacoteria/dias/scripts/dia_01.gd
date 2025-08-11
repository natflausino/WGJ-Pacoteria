extends Node2D

@onready var character_sprite = $Character/Avatar

@onready var puzzle: Panel = $Puzzle
@onready var v_caixa: TextureRect = $velinha_caixa
@onready var v_button: Button = $velinha_caixa/velinha_botao
@onready var c_caixa: TextureRect = $crianca_caixa
@onready var c_button: Button = $crianca_caixa/crianca_botao
var dialogue = 1

var character_sprites = {
	"Crianca": preload("res://dias/assets/characters/Crianca.png"),
	"Gotique": preload("res://dias/assets/characters/Gotique.png"),
	"Senhorinha": preload("res://dias/assets/characters/Senhorinha.png"),
	"Maromba": preload("res://dias/assets/characters/Maromba.png"),
	"Chefe": preload("res://dias/assets/characters/Chefe.png"),
}

func _ready():
	$MadTalk.start_dialog("dialogue_day1", 0)
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
	

func start_second_dialogue():
	$MadTalk.start_dialog("dialogue_day1", 2)
	$MadTalk.connect("speaker_changed", Callable(self, "_on_speaker_changed"))

func start_final_dialogue():
	$MadTalk.start_dialog("dialogue_day1", 4)
	$MadTalk.connect("speaker_changed", Callable(self, "_on_speaker_changed"))

func _on_caixa1_pressed():
	v_caixa.visible = false
	puzzle.visible = true

func _on_caixa2_pressed():
	c_caixa.visible = false
	puzzle.visible = true

func verify_puzzle_open():
		if puzzle.visible == false and v_caixa.visible == false and dialogue == 1:
			c_caixa.visible = true
			dialogue = 2
			start_second_dialogue()
		elif puzzle.visible == false and v_caixa.visible == false and c_caixa.visable == false and dialogue == 2:
			start_final_dialogue()
	
