extends Control

@onready var audio = $AudioStreamPlayer2D
@onready var normal_menu =$NormalMenu
@onready var settings_menu = $SettingsMenu
var setting_on = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://scenes/loading_screen.tscn")
	pass # Replace with function body.

func _process(_delta):
	if Input.is_action_just_pressed("Settings"):
		settings_menu_controller()
		
func settings_menu_controller():
	if setting_on:
		settings_menu.hide()
		normal_menu.show()
		Engine.time_scale = 1
	else:
		normal_menu.hide()
		settings_menu.show()
		Engine.time_scale = 0
	setting_on = !setting_on


func _on_settings_button_pressed():
	settings_menu_controller()
	

