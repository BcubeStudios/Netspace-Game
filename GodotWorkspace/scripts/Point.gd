extends Node2D
class_name Point

var pointName: String
var coords: Vector2i
var edges: Array[Edge]

# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()
	pass # Replace with function body.

func activate(name, coords):
	self.show()
	self.pointName = name
	self.coords = coords


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func do_right_click():
	print("right " + pointName)
	pass

func do_left_click():
	print("left " + pointName)
	pass
	
func is_inside(position):
	pass


func _draw(): 
	pass
