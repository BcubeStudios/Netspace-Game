extends Node2D

#the speed of the text shown
var textSpeed:float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# slowly shows more text
func show_text():
	textSpeed += 0.25
	$Panel/EndLabel.visible_characters = int(textSpeed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	show_text()
	pass

