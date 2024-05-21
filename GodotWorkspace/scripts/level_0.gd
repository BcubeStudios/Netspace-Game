extends Node2D

@onready var dir = $gamePanel/Director

var step:int

func _ready():
	step = 0
	dir.max_phedge = 1000
	dir.set_cable_length(100000)
	$HUD/InfoPanel/InfoLabel.text = "An interconnected network of routers and end users should have some fun name.... like the Internet"
	$HUD/ObjectivesPanel/ObjectivesLabel.text = "Connect all the nodes to advance the level. Remember to RIGHT-CLICK to delete unwanted edges."
	
	dir.create_end_point("point1", (Vector2i(450, 450)))
	dir.create_end_point("point2", (Vector2i(850, 450)))
	
	$Control/panel1.show()
	$Control/panel2.hide()
	$Control/panel3.hide()
	$Control/panel4.hide()
	
	$gamePanel/solveButton.hide()
	
	
func level_won():
	if step >= 6:
		await Global.wait(0.5)
		get_tree().change_scene_to_file("res://scenes/ending.tscn")
	step = step + 1
	next_step()

func next_step():
	match step:
		1:
			await Global.wait(0.5)
			$Control/panel1.hide()
			await Global.wait(0.5)
			$Control/panel3.show()
			dir.create_variable_point("point3", (Vector2i(650, 150)),4)
			await Global.wait(1.5)
			$Control/panel2.show()
		2:
			await Global.wait(0.5)
			$Control/panel2.hide()
			$Control/panel3.hide()
			dir.create_end_point("point4", (Vector2i(650, 550)))
		3:
			await Global.wait(0.5)
			dir.create_point("point5", (Vector2i(1000, 150)))
		4:
			await Global.wait(0.5)
			$Control/panel4.show()
			dir.create_end_point("point6", (Vector2i(1050, 300)))
		5:
			await Global.wait(0.5)
			dir.create_end_point("point7", (Vector2i(900, 650)))
		6:
			await Global.wait(0.5)
			dir.create_end_point("point8", (Vector2i(330, 200)))
