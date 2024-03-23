extends Control


@onready var main = $"../"
@onready var musicSlider = $MarginContainer/VBoxContainer/MusicSlider
# Called when the node enters the scene tree for the first time.
func _ready():
	musicSlider.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")) + 35

#quits back to main menu
func _on_exit_button_pressed():
	get_tree().change_scene_to_file("res://screens/title_screen.tscn")

#changes scene to the credits scene
func _on_credits_button_pressed():
	get_tree().change_scene_to_file("res://screens/credits_screen.tscn")
	pass # Replace with function body.

#changes volume of music
func _on_music_slider_drag_ended(value_changed):
	if value_changed:
		var value = musicSlider.value - 35
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
	else:
		pass

#quits game entirely
func _on_quit_button_pressed():
	get_tree().quit()

#coninues back to where it was
func _on_continue_button_pressed():
	main.settingsMenu()
