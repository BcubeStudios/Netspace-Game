extends Control

@onready var musicSlider = $MarginContainer/VBoxContainer/MusicSlider


# Called when the node enters the scene tree for the first time.
func _ready():
	musicSlider.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")) + 35

# quits back to main menu
func _on_exit_button_pressed():
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")

# quits game entirely
func _on_quit_button_pressed():
	get_tree().quit()

# changes volume of music
func _on_music_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value - 35)


func _on_credits_button_pressed():
	get_tree().change_scene_to_file("res://scenes/credits_screen.tscn")

func _on_music_toggle_toggled(toggled_on):
	var master_bus = AudioServer.get_bus_index("Master")
	if toggled_on:
		AudioServer.set_bus_mute(master_bus, false)
	else:
		AudioServer.set_bus_mute(master_bus, true)
