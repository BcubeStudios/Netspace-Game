extends Node2D

# progress bar percentage
var percentage: int = 0

# Called when the node enters the scene tree for the first time.
# initalizes global values
# initalises the master volume
func _ready():
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -10)
	pass 

# slowly loads te progress bar
func loadBar():
	if percentage <=100:
		percentage += 2
		$ProgressBar.value = percentage
		pass
	else:
		change_scene()

# changes to the demo
func change_scene():
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	loadBar()
	pass
