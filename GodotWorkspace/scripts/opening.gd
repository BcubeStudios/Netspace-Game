extends Node2D

@onready var progressBar = $ProgressBar
#progress bar percentage
var percentage: int = 0

# Called when the node enters the scene tree for the first time.
#initalizes global values
#initalises the master volume
func _ready():
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -10)
	pass 

#slowly loads te progress bar
func loadBar():
	if percentage <=100:
		percentage += 4
		progressBar.value = percentage
		pass
	else:
		changeScene()

#changes to the demo
func changeScene():
	get_tree().change_scene_to_file("res://screens/title_screen.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	loadBar()
	pass
