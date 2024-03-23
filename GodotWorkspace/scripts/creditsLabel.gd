extends Label

#the speed of the text shown
var textSpeed:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# slowly shows more text
func showText():
	textSpeed += 1
	self.visible_characters = textSpeed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	showText()
	pass
