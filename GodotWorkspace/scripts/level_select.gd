extends Node2D

var setting_on = false

func _on_demo_button_pressed():
	get_tree().change_scene_to_file("res://scenes/demo_level.tscn")

func _on_level_0_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level_0.tscn")

func _on_tsp_button_pressed():
	get_tree().change_scene_to_file("res://scenes/tsp_level.tscn")

func _on_level_1_button_pressed():
	pass # Replace with function body.

func _on_level_2_button_pressed():
	pass # Replace with function body.


func _on_demo_button_mouse_entered():
	move_child($demoButton, 5)

func _on_level_0_button_mouse_entered():
	move_child($level0Button, 5)

func _on_level_1_button_mouse_entered():
	move_child($level1Button, 5)

func _on_level_2_button_mouse_entered():
	move_child($level2Button, 5)

func _on_tsp_button_mouse_entered():
	move_child($tspButton, 5)
