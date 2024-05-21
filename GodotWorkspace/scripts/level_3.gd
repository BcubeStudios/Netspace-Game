extends Node2D

func _ready():
	var dir = $gamePanel/Director
	
	# set max phedge and max cable that can be used
	dir.max_phedge = 700
	dir.set_cable_length(3600)
	
	# Modify 
	$HUD/InfoPanel/InfoLabel.text = " INFO"
	$HUD/ObjectivesPanel/ObjectivesLabel.text = "OBJECTIVES"
	
	# Add points here (end, normal, or varible with a max amount of edges)
	dir.create_variable_point("point1", Vector2i(680, 85), 3)

func level_won():
	await Global.wait(0.5)
	get_tree().change_scene_to_file("res://scenes/ending.tscn")
