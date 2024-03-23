extends Control

@onready var audio = $AudioStreamPlayer2D
@onready var normal_menu =$NormalMenu
@onready var settings_menu = $SettingsMenu
var setting_on = false

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://screens/loading_screen.tscn")
	pass # Replace with function body.

func _process(_delta):
	if Input.is_action_just_pressed("Settings"):
		settingsMenu()
		
func settingsMenu():
	if setting_on:
		settings_menu.hide()
		normal_menu.show()
		Engine.time_scale = 1
	else :
		normal_menu.hide()
		settings_menu.show()
		Engine.time_scale = 0
	setting_on = !setting_on


func _on_settings_button_pressed():
	settingsMenu()
	

func change_volume(new_volume):
	audio.volume_db = (new_volume - 35)
	
func toggle_volume():
	audio.playing = !audio.playing
