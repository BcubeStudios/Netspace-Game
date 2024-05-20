extends Node2D

func _ready():
	var dir = $gamePanel/Director
	
	# set max phedge and max cable that can be used
	dir.max_phedge = 1000
	dir.set_cable_length(100000)
	
	# Modify 
	$HUD/InfoPanel/InfoLabel.text = "INFORMATION HERE"
	$HUD/ObjectivesPanel/ObjectivesLabel.text = "DO SOMETHING."
	
	# Add points here (end, normal, or varible with a max amount of edges)
	dir.create_end_point("point1", Vector2i(700, 100))
	dir.create_end_point("point2", Vector2i(950, 500))

func level_won():
	await Global.wait(1.5)
	get_tree().change_scene_to_file("res://scenes/ending.tscn")
