extends Panel

var is_visible = true

func _on_setting_button_pressed():
	if is_visible:
		self.show()
		Engine.time_scale = 0
	else:
		self.hide()
		Engine.time_scale = 1
	is_visible = !is_visible
