extends Control


@onready var main = $"../"

#quits back to main menu
#should change to go on previous scene
func _on_exit_button_pressed():
	get_tree().change_scene_to_file("res://screens/title_screen.tscn")

#changes scene to the credits scene
func _on_credits_button_pressed():
	get_tree().change_scene_to_file("res://screens/credits_screen.tscn")
	pass # Replace with function body.

#changes volume of music
func _on_music_slider_drag_ended(value_changed):
	if value_changed:
		var value = $MarginContainer/VBoxContainer/MusicSlider.value - 35
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
	else:
		pass

#quits game entirely
func _on_quit_button_pressed():
	get_tree().quit()
