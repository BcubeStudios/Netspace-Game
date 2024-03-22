extends Control


@onready var main = $"../"

func _on_exit_button_pressed():
	main.settingsMenu()


func _on_credits_button_pressed():
	# get_tree().change_scene( INSERT SCENE HERE)
	pass # Replace with function body.


func _on_music_slider_drag_ended(value_changed):
	if value_changed:
		var value = $MarginContainer/VBoxContainer/MusicSlider.value
		main.change_volume(value)
	else:
		pass


func _on_quit_button_pressed():
	get_tree().quit()
