extends Node2D

var setting_on = false
@onready var length_label = $backgroundPanel/cablePanel/length_Label
@onready var curr_length_label = $backgroundPanel/currCablePanel/curr_length_Label
@onready var director_scene = preload("res://scenes/director.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.First_time:
		$explanation.show()
	Global.First_time = false
	var dir = $backgroundPanel/Director
	dir.createEndPoint("point1", Vector2i(700, 100))
	dir.createEndPoint("point2", Vector2i(950, 500))
	dir.createPoint("point3", Vector2i(500, 500))
	dir.createPoint("point4", Vector2i(700, 300))
	dir.createPoint("point5", Vector2i(700, 500))
	
	dir.length_left = 1000
	


func _process(_delta):
	if Input.is_action_just_pressed("Settings"):
		settingsMenu()
	length_label.text = str(int($backgroundPanel/Director.length_left))
	curr_length_label.text = str(int($backgroundPanel/Director.curr_length))


func settingsMenu():
	var setting_panel = $HUD/settingPanel
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

func _on_reset_button_pressed():
	self.reset()
	
func level_won():
	await Global.wait(1.5)
	get_tree().change_scene_to_file("res://scenes/ending.tscn")

func reset():
	get_tree().change_scene_to_file("res://scenes/demo_level.tscn")

func _on_solve_button_pressed():
	$backgroundPanel/Director.auto_solve()
