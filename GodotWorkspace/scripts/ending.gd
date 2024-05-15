extends Node2D
#the speed of the text shown
var textSpeed:float = 0
var setting_on = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	show_text()
	if Input.is_action_just_pressed("Settings"):
		settingsMenu()

# slowly shows more text
func show_text():
	textSpeed += 0.25
	$Panel/EndLabel.visible_characters = int(textSpeed)

func _on_setting_button_pressed():
	settingsMenu()

func settingsMenu():
	var setting_panel = $SettingsMenu
	if setting_on:
		setting_panel.hide()
	else :
		setting_panel.show()
	setting_on = !setting_on


func _on_continue_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")
