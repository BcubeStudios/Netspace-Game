extends Node2D

func _ready():
	var dir = $gamePanel/Director
	
	# set max phedge and max cable that can be used
	dir.max_phedge = 700
	dir.set_cable_length(3600)
	
	# Modify 
	$HUD/InfoPanel/InfoLabel.text = "A router helps you connect multiple devices to the Internet, and connect the devices to each other. Regardless of how many networks are attached, though, the basic operation and function of the router remains the same."
	$HUD/ObjectivesPanel/ObjectivesLabel.text = "Connect the nodes together: Watch out for NODES that have a max load."
	
	# Add points here (end, normal, or varible with a max amount of edges)
	dir.create_variable_point("point1", Vector2i(680, 85), 3)
	dir.create_point("point2", Vector2i(415, 260))
	dir.create_point("point3", Vector2i(945, 275))
	dir.create_variable_point("point4", Vector2i(660, 290), 5)
	
	dir.create_end_point("point5", Vector2i(310, 100))
	dir.create_end_point("point6", Vector2i(230, 240))
	dir.create_end_point("point7", Vector2i(275, 450))
	dir.create_end_point("point8", Vector2i(520, 480))
	dir.create_end_point("point9", Vector2i(770, 610))
	dir.create_end_point("point10", Vector2i(800, 460))
	dir.create_end_point("point11", Vector2i(1070, 170))
	dir.create_end_point("point12", Vector2i(1120, 310))
	dir.create_end_point("point13", Vector2i(1010, 400))
	dir.create_end_point("point13", Vector2i(580, 630))

func level_won():
	await Global.wait(0.5)
	get_tree().change_scene_to_file("res://scenes/ending.tscn")
