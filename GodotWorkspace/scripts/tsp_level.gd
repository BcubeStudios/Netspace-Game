extends Node2D

var max_phedge = 800

# Called when the node enters the scene tree for the first time.
func _ready():
	var dir = $gamePanel/Director
	dir.max_phedge = 1000000
	$HUD/objectivesPanel/objectivesLabel.text = "yhvbgutvctuyc"
	
	dir.createPoint("point1", randomCoordinates(Vector2i(640, 100)))
	dir.createPoint("point2", randomCoordinates(Vector2i(910, 230)))
	dir.createPoint("point3", randomCoordinates(Vector2i(1120, 360)))
	dir.createPoint("point4", randomCoordinates(Vector2i(910, 490)))
	dir.createPoint("point5", randomCoordinates(Vector2i(640, 620)))
	dir.createPoint("point6", randomCoordinates(Vector2i(370, 490)))
	dir.createPoint("point7", randomCoordinates(Vector2i(160, 360)))
	dir.createPoint("point8", randomCoordinates(Vector2i(370, 230)))

	
	dir.length_left = 100000

func randomCoordinates(expectedCoords):
	
	var random = RandomNumberGenerator.new()
	random.randomize()
	var x = random.randi_range(expectedCoords[0] - 100, expectedCoords[0] + 100)
	var y = random.randi_range(expectedCoords[1] - 100, expectedCoords[1] + 100)
	return Vector2(x, y)
	
func level_won():
	await Global.wait(1.5)
	get_tree().change_scene_to_file("res://scenes/ending.tscn")

func reset():
	get_tree().change_scene_to_file("res://scenes/demo_level.tscn")


