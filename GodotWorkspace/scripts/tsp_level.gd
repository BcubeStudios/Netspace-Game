extends Node2D

var max_phedge = 800

# Called when the node enters the scene tree for the first time.
func _ready():
	var dir = $gamePanel/Director
	dir.max_phedge = 1000
	dir.setCableLength(100000)
	
	$HUD/objectivesPanel/objectivesLabel.text = "Connect all 
	the nodes using 
	the least amount
	of cable possible"
	$gamePanel/cablePanel/cable_Label.text = "Current Cable Used"
	$gamePanel/cablePanel/length_Label.hide()
	
	dir.createVariablePoint("point1", randomCoordinates(Vector2i(640, 100)), 2)
	dir.createVariablePoint("point2", randomCoordinates(Vector2i(910, 230)), 2)
	dir.createVariablePoint("point3", randomCoordinates(Vector2i(1120, 360)), 2)
	dir.createVariablePoint("point4", randomCoordinates(Vector2i(910, 490)), 2)
	dir.createVariablePoint("point5", randomCoordinates(Vector2i(640, 620)), 2)
	dir.createVariablePoint("point6", randomCoordinates(Vector2i(370, 490)), 2)
	dir.createVariablePoint("point7", randomCoordinates(Vector2i(160, 360)), 2)
	dir.createVariablePoint("point8", randomCoordinates(Vector2i(370, 230)), 2)


func randomCoordinates(expectedCoords):
	
	var random = RandomNumberGenerator.new()
	random.randomize()
	var x = random.randi_range(expectedCoords[0] - 80, expectedCoords[0] + 80)
	var y = random.randi_range(expectedCoords[1] - 80, expectedCoords[1] + 80)
	return Vector2(x, y)
	
func level_won():
	await Global.wait(1.5)
	get_tree().change_scene_to_file("res://scenes/ending.tscn")

func reset():
	get_tree().change_scene_to_file("res://scenes/demo_level.tscn")

func _process(_delta):
	$scoreLabel.text = str(int(100000 - $gamePanel/Director.length_left))
