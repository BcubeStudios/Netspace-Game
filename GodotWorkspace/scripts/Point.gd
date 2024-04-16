extends Node2D
class_name Point

@onready var director = $"../"

var pointName: String
var coords: Vector2i
var edges: Array[Edge]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func activate(point_name, point_coords):
	self.pointName = point_name
	self.coords = point_coords
	self.global_position = point_coords
	print(self.global_position)
	print(pointName)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func do_right_click():
	print("right " + pointName)
	pass

func do_left_click():
	print("left " + pointName)
	pass
	

func _draw(): 
	#draw_circle(coords, 20, Global.Colours["red"])
	pass


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
	edges.append(edge)
	return true
