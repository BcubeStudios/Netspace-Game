extends Node2D
class_name Edge

var point1: Point
var point2: Point
var colour: Color = Global.Colours["black"]
var id: String
var length: float


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init(new_point1, new_point2):
	self.point1 = new_point1
	self.point2 = new_point2
	self.id = str(max(point1.coords.x, point2.coords.x))+ \
	str(min(point1.coords.x, point2.coords.x)) + str(max(point1.coords.y, point2.coords.y)) +\
	str(min(point1.coords.y, point2.coords.y))
	self.length = sqrt(((point1.coords.x - point2.coords.x)**2) * ((point1.coords.y - point2.coords.y)**2))

func color_change():
	pass

func _draw():
	draw_line(point1.coords, point2.coords, colour, 4)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
