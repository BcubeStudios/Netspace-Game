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
	$Area2D/icon.frame = 1

func _on_area_2d_mouse_entered():
	director.change_current_point(self)
	$Area2D/icon.frame = 2

func _on_area_2d_mouse_exited():
	director.change_current_point(null)
	if(edges.is_empty()):
		$Area2D/icon.frame = 1
	else:
		$Area2D/icon.frame = 0
	
func add_edge(edge:Edge) -> bool:
	for old_edge in edges:
		if old_edge.id == edge.id:
			return false
	$Area2D/icon.frame = 0
	edges.append(edge)
	return true

func remove_edge(edge:Edge) -> bool:
	var x = 0
	for old_edge in edges:
		if old_edge.id == edge.id:
			edges.remove_at(x)
			return true
		x = x + 1
	return false

func curr_frame()-> int:
	return $Area2D/icon.frame
