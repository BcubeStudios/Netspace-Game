extends Node2D
class_name Edge

var point1: Point
var point2: Point
var colour: Color
var id: String


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init(point1, point2):
	self.point1 = point1
	self.point2 = point2
	colour = Color(255, 255, 255)
	print("succsess edge!")

func color_change():
	pass

func _draw():
	draw_line(point1.coords, point2.coords, colour)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
