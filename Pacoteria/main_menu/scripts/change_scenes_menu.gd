extends Control

func _ready():
	AudioPlayer._play_all_music(1)

func _on_start_pressed() -> void:
	pass # Replace with function body.

func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu/credits.tscn")

func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu/settings.tscn")
	
func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu/menu.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()
