extends Control

var setting_on = false


func _process(_delta):
	if Input.is_action_just_pressed("Settings"):
		settingsMenu()

func settingsMenu():
	var setting_panel = $SettingPanel
	var overlay = $overlay
	if setting_on:
		setting_panel.hide()
		overlay.hide()
		Engine.time_scale = 1
	else :
		setting_panel.show()
		overlay.show()
		Engine.time_scale = 0
	setting_on = !setting_on


#activates the settings mode
func _on_setting_button_pressed():
	settingsMenu()


#toggles the info panel
func _on_info_toggle_toggled(toggled_on):
	var info_graphic = $InfoPanel
	if toggled_on:
		info_graphic.show()
	else:
		info_graphic.hide()


#toggles the objectives panel
func _on_objectives_toggle_toggled(toggled_on):
	var objectives_graphic = $ObjectivesPanel
	if toggled_on:
		objectives_graphic.show()
	else:
		objectives_graphic.hide()

