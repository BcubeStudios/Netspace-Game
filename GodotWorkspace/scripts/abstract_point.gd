extends Node2D
class_name AbstractPoint

@onready var director = $"../"

var point_name: String
var coords: Vector2i

func activate(new_point_name, new_point_coords):
	self.point_name = new_point_name
	self.coords = new_point_coords
	self.global_position = new_point_coords

func _on_area_2d_mouse_entered():
	director.change_pointing_at(self)

func _on_area_2d_mouse_exited():
	director.change_pointing_at(null)

func add_edge(_edge:Edge) -> bool:
	return false

func remove_edge(_edge:Edge) -> bool:
	return false

func curr_frame()-> int:
	return -1
	

func possible_edge(_edge:Edge) -> bool:
	return false
