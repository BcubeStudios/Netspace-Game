extends Panel

var visiblePanel = true

func _on_setting_button_pressed():
	if visiblePanel:
		self.show()
		Engine.time_scale = 0
	else:
		self.hide()
		Engine.time_scale = 1
	visiblePanel = !visiblePanel
