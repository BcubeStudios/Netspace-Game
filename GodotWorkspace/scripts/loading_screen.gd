extends Node2D

# progress bar percentage
var percentage: int = 0


# slowly loads te progress bar
func load_bar():
	if percentage <=100:
		percentage += 1
		$ProgressBar.value = percentage
		pass
	else:
		changeScene()

#changes to the demo
func changeScene():
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
# calls to play the animation and the loading bar
func _process(_delta):
	$AnimatedRouter.play()
	load_bar()
	pass
