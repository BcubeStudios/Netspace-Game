extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.First_time:
		$explanation.show()
	Global.First_time = false
	var dir = $gamePanel/Director
	dir.createEndPoint("point1", Vector2i(700, 100))
	dir.createEndPoint("point2", Vector2i(950, 500))
	dir.createPoint("point3", Vector2i(500, 500))
	dir.createPoint("point4", Vector2i(700, 300))
	dir.createPoint("point5", Vector2i(700, 500))
	
	dir.length_left = 1000

	
func level_won():
	await Global.wait(1.5)
	get_tree().change_scene_to_file("res://scenes/ending.tscn")

func reset():
	get_tree().change_scene_to_file("res://scenes/demo_level.tscn")


