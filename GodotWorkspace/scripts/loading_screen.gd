extends Node2D

@onready var progressBar = $ProgressBar
#progress bar percentage
var percentage: int = 0


#slowly loads te progress bar
func loadBar():
	if percentage <=100:
		percentage += 1
		progressBar.value = percentage
		pass
	else:
		changeScene()

#changes to the demo
func changeScene():
	get_tree().change_scene_to_file("res://screens/demo_level.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	loadBar()
	pass
