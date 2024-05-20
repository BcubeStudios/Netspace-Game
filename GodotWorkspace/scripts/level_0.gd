extends Node2D

@onready var dir = $gamePanel/Director

var step:int

func _ready():
	step = 0
	dir.max_phedge = 1000
	dir.set_cable_length(100000)
	$HUD/InfoPanel/InfoLabel.text = "An interconnected network of routers and end users should have some fun name.... like the Internet"
	$HUD/ObjectivesPanel/ObjectivesLabel.text = "Connect all the nodes to advance the level."
	
	dir.create_end_point("point1", (Vector2i(450, 450)))
	dir.create_end_point("point2", (Vector2i(850, 450)))
	
	$Control/panel1.show()
	$Control/Panel2.hide()
	
	
func level_won():
	if step >= 5:
		await Global.wait(1.5)
		get_tree().change_scene_to_file("res://scenes/ending.tscn")
	step = step + 1
	next_step()

func next_step():
	match step:
		1:
			$Control/panel1.hide()
			$Control/Panel2.show()
			await Global.wait(0.5)
			dir.create_point("point3", (Vector2i(650, 150)))
		2:
			$Control/Panel2.hide()
			await Global.wait(0.5)
			dir.create_end_point("point4", (Vector2i(650, 550)))
		3:
			await Global.wait(0.5)
			dir.create_point("point5", (Vector2i(1000, 150)))
		4:
			await Global.wait(0.5)
			dir.create_end_point("point6", (Vector2i(1000, 450)))
		5:
			await Global.wait(0.5)
			dir.create_end_point("point7", (Vector2i(900, 650)))
