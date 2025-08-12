extends Control

func _on_start_pressed():
	get_tree().change_scene_to_file("res://dias/scenes/dia1_1.tscn")

func _on_credits_pressed():
	get_tree().change_scene_to_file("res://main_menu/scenes/credits.tscn")

func _on_settings_pressed():
	get_tree().change_scene_to_file("res://main_menu/scenes/settings.tscn")
	
func _on_menu_pressed():
	get_tree().change_scene_to_file("res://main_menu/scenes/menu.tscn")

func _on_exit_pressed():
	get_tree().quit()
