extends Node2D

var max_phedge = 800

# Called when the node enters the scene tree for the first time.
func _ready():
	var dir = $gamePanel/Director
	dir.max_phedge = 1000
	dir.set_cable_length(100000)
	$HUD/InfoPanel/InfoLabel.text = "The Traveling Salesman Problem aka TSP is a problem in graph theory. It asks a given a list of nodes, how can we visit each one at least once, while returning to the origin, using the least amount of lenght possible. Here you can try to find the shortest amount of lenght. In the real world there are many algorithms that try to solve this problem most efficiently."
	$HUD/ObjectivesPanel/ObjectivesLabel.text = "Connect all the nodes at least once using the least amount of cable possible. The edge should return to the origine node."

	$gamePanel/cablePanel/cable_Label.text = "Current Cable Used"
	$gamePanel/cablePanel/length_Label.hide()
	
	$gamePanel/solveButton.hide()
	
	dir.create_variable_point("point1", randomCoordinates(Vector2i(640, 100)), 2)
	dir.create_variable_point("point2", randomCoordinates(Vector2i(910, 230)), 2)
	dir.create_variable_point("point3", randomCoordinates(Vector2i(1120, 360)), 2)
	dir.create_variable_point("point4", randomCoordinates(Vector2i(910, 490)), 2)
	dir.create_variable_point("point5", randomCoordinates(Vector2i(640, 620)), 2)
	dir.create_variable_point("point6", randomCoordinates(Vector2i(370, 490)), 2)
	dir.create_variable_point("point7", randomCoordinates(Vector2i(160, 360)), 2)
	dir.create_variable_point("point8", randomCoordinates(Vector2i(370, 230)), 2)


func randomCoordinates(expectedCoords):
	
	var random = RandomNumberGenerator.new()
	random.randomize()
	var x = random.randi_range(expectedCoords[0] - 80, expectedCoords[0] + 80)
	var y = random.randi_range(expectedCoords[1] - 80, expectedCoords[1] + 80)
	return Vector2(x, y)
	
func level_won():
	await Global.wait(1.5)
	get_tree().change_scene_to_file("res://scenes/ending.tscn")


func _process(_delta):
	$scoreLabel.text = str(int($gamePanel/Director.max_length - $gamePanel/Director.length_left))
