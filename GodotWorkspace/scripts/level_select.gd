extends Node2D

var setting_on = false

func _on_demo_button_pressed():
	get_tree().change_scene_to_file("res://scenes/demo_level.tscn")

func _on_level_0_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level_0.tscn")

func _on_tsp_button_pressed():
	get_tree().change_scene_to_file("res://scenes/tsp_level.tscn")
