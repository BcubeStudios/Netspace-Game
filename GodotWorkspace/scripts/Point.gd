extends Node2D
class_name Point

@onready var director = $"../"

var pointName: String
var coords: Vector2i
var edges: Array[Edge]


func activate(point_name, point_coords):
	self.pointName = point_name
	self.coords = point_coords
	self.global_position = point_coords
	$Area2D/icon.frame = 0

func _on_area_2d_mouse_entered():
	director.change_current_point(self)
	print("Point changed!")
	print(pointName)

func _on_area_2d_mouse_exited():
	director.change_current_point(null)
	print("No longer pointing!")
	
func add_edge(edge:Edge) -> bool:
	for old_edge in edges:
		if old_edge.id == edge.id:
			return false
	$Area2D/icon.frame = 1
	edges.append(edge)
	return true
