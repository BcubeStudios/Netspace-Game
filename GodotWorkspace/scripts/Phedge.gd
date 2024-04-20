extends Node2D
class_name Phedge

var origin: Point
var end: Vector2i
var colour: Color = Global.Colours["green"]
var id: String
var maxLenght: float = 300
var length: float

func _ready():
	length = 0

func is_active()->bool:
	return origin != null
	
func is_valid()->bool:
	return get_length() < maxLenght

func _draw():
	if is_active() and is_valid():
		draw_line(origin.coords, end, colour, 4)
	elif is_active() and !(is_valid()):
		draw_line(origin.coords, end, Global.Colours["red"], 4)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#Insert displaying code, collect mouse position use it as endpoint, draw_line() can be used
	if self.is_active():
		end = get_viewport().get_mouse_position()
		queue_redraw()
		self.length = sqrt(((origin.coords.x - end.x)**2) + ((origin.coords.y - end.y)**2))
	pass
	
func set_origin(point):
	origin = point
	
func get_length() -> float:
	if is_active():
		return (origin.coords-end).length()
	else:
		return 0

func reset_origin():
	length = 0
	origin=null
	queue_redraw()
