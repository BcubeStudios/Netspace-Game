extends Node2D

var setting_on = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(_delta):
	if Input.is_action_just_pressed("Settings"):
		settingsMenu()


func settingsMenu():
	var setting_panel = $HUD/settingPanel
	var overlay = $overlay
	var level = $backgroundPanel
	if setting_on:
		setting_panel.hide()
		overlay.hide()
		level.show()
		Engine.time_scale = 1
	else :
		setting_panel.show()
		overlay.show()
		level.hide()
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
