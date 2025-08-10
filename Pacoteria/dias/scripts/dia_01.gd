extends Node2D

func _ready():
	$MadTalk.start_dialog("dialogo_inicial")

func _input(event):
	if (
		(event is InputEventKey) and (event.pressed) and (not event.echo) and (event.keycode in [KEY_SPACE, KEY_ENTER, KEY_KP_ENTER])
	) or (
		(event is InputEventMouseButton) and (event.pressed) and (event.button_index == MOUSE_BUTTON_LEFT)
	):
		$MadTalk.dialog_acknowledge()
	
	elif (event is InputEventKey) and (event.pressed) and (not event.echo) and (event.keycode == KEY_1):
		$MadTalk.start_dialog("dialogo_inicial")
