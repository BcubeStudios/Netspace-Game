extends Node2D

var setting_on = false
@onready var settings_menu = $SettingsMenu
@onready var setting_panel = $settingPanel
@onready var settings_button = $settingButton

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(_delta):
	if Input.is_action_just_pressed("Settings"):
		settingsMenu()
		
func settingsMenu():
	if setting_on:
		settings_menu.hide()
		setting_panel.hide()
		settings_button.show()
		Engine.time_scale = 1
	else :
		settings_button.hide()
		setting_panel.show()
		settings_menu.show()
		Engine.time_scale = 0
	setting_on = !setting_on
pass


func _on_setting_button_pressed():
	settingsMenu()
	pass # Replace with function body.
