extends Node2D
class_name AbstractPoint

@onready var director = $"../"

var pointName: String
var coords: Vector2i

func activate(point_name, point_coords):
	self.pointName = point_name
	self.coords = point_coords
	self.global_position = point_coords

func _on_area_2d_mouse_entered():
	director.change_current_point(self)

func _on_area_2d_mouse_exited():
	director.change_current_point(null)
	
func add_edge(_edge:Edge) -> bool:
	return false

func remove_edge(_edge:Edge) -> bool:
	return false

func curr_frame()-> int:
	return -1
	

func possible_edge(_edge:Edge) -> bool:
	return false
