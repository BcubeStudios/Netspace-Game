extends Node2D


var setting_on = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.First_time:
		$explanation.show()
	Global.First_time = false

	var dir = $gamePanel/Director
	dir.create_point("point1", Vector2i(700, 100))
	dir.create_point("point2", Vector2i(950, 500))
	dir.create_point("point3", Vector2i(500, 500))
	dir.create_point("point4", Vector2i(700, 300))
	dir.create_point("point5", Vector2i(700, 500))
	
	dir.set_cable_length(1000)

func level_won():
	await Global.wait(0.5)
	get_tree().change_scene_to_file("res://scenes/ending.tscn")

