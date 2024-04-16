extends Node2D
class_name Edge

var point1: Point
var point2: Point
var colour: Color = Global.Colours["red"]
var id: String


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init(new_point1, new_point2):
	self.point1 = new_point1
	self.point2 = new_point2
	print("succsess edge!")

func color_change():
	pass

func _draw():
	draw_line(point1.coords, point2.coords, colour, 3)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
