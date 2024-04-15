extends Node2D

var setting_on = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(_delta):
	if Input.is_action_just_pressed("Settings"):
		settingsMenu()


func settingsMenu():
	var settings_menu = $HUD/settingPanel/SettingsMenu
	var setting_panel = $HUD/settingPanel
	var settings_button = $HUD/settingButton
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


#activates the settings mode
func _on_setting_button_pressed():
	settingsMenu()
	pass # Replace with function body.


#toggles the info panel
func _on_info_toggle_toggled(toggled_on):
	var info_graphic = $HUD/infoPanel
	if toggled_on:
		info_graphic.show()
	else:
		info_graphic.hide()


#toggles the objectives panel
func _on_objectives_toggle_toggled(toggled_on):
	var objectives_graphic = $HUD/objectivesPanel 
	if toggled_on:
		objectives_graphic.show()
	else:
		objectives_graphic.hide()
