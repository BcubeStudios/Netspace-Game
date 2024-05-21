extends Node2D

func _ready():
	var dir = $gamePanel/Director
	
	# set max phedge and max cable that can be used
	dir.max_phedge = 1000
	dir.set_cable_length(100000)
	
	# Modify 
	$HUD/InfoPanel/InfoLabel.text = "Routers: in the real world, a router connects devices between networks! Here we have 2 networks that need connecting. We could connect every device to each other but that would use up a lot of cable. In the real world, it would be impossible to connect every single device to an other device, so we use routers!"
	$HUD/ObjectivesPanel/ObjectivesLabel.text = "Connect all the nodes using the router! Remember, some nodes can only have one connection while others (routers) can have multiple.	"
	
	# Add points here (end, normal, or varible with a max amount of edges)
	dir.create_point("router1", randomCoordinates(Vector2i(480, 360)))
	dir.create_end_point("point1a", randomCoordinates(Vector2i(370, 160)))
	dir.create_end_point("point2a", randomCoordinates(Vector2i(100, 360)))
	dir.create_end_point("point3a", randomCoordinates(Vector2i(370, 490)))
	dir.create_end_point("point4a", randomCoordinates(Vector2i(210, 200)))
	dir.create_end_point("point5a", randomCoordinates(Vector2i(210, 300)))
	dir.create_end_point("point6a", randomCoordinates(Vector2i(180, 520)))
	
	
	dir.create_point("router2", randomCoordinates(Vector2i(800, 360)))
	dir.create_end_point("point1b", randomCoordinates(Vector2i(910, 230)))
	dir.create_end_point("point2b", randomCoordinates(Vector2i(1100, 360)))
	dir.create_end_point("point3b", randomCoordinates(Vector2i(910, 490)))

func level_won():
	await Global.wait(0.5)
	get_tree().change_scene_to_file("res://scenes/ending.tscn")
	
func randomCoordinates(expectedCoords):
	
	var random = RandomNumberGenerator.new()
	random.randomize()
	var x = random.randi_range(expectedCoords[0] - 30, expectedCoords[0] + 30)
	var y = random.randi_range(expectedCoords[1] - 30, expectedCoords[1] + 30)
	return Vector2(x, y)
