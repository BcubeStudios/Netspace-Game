extends Node2D

#the speed of the text shown
var textSpeed:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# slowly shows more text
func show_text():
	textSpeed += 1
	$CreditsPanel/CreditsLabel.visible_characters = textSpeed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	show_text()
	pass

func _on_exit_button_pressed():
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
