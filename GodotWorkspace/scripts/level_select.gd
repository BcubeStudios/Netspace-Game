extends Node2D

var setting_on = false

func _process(_delta):
	if Input.is_action_just_pressed("Settings"):
		settingsMenu()

func _on_setting_button_pressed():
	settingsMenu()

func settingsMenu():
	var setting_panel = $SettingPanel
	if setting_on:
		setting_panel.hide()
	else :
		setting_panel.show()
	setting_on = !setting_on

func _on_demo_button_pressed():
	get_tree().change_scene_to_file("res://scenes/demo_level.tscn")

func _on_level_0_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level_0.tscn")

func _on_tsp_button_pressed():
	get_tree().change_scene_to_file("res://scenes/tsp_level.tscn")
