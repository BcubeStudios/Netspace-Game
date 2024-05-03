extends Node2D
class_name Phedge

var origin: Point
var end: Vector2i
var colour: Color = Global.Colours["green"]
var id: String
var max_length: float = 300
var length: float
var forced_end = null

func _ready():
	self.length = 0

func is_active()->bool:
	return origin != null
	
func is_valid(end_point = self.end)->bool:
	return calculate_lenght(end_point) <= self.max_length

func _draw():
	if is_active() and is_valid():
		draw_line(origin.coords, end, colour, 4)
	elif is_active() and !(is_valid()):
		draw_line(origin.coords, end, Global.Colours["red"], 4)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#Insert displaying code, collect mouse position use it as endpoint, draw_line() can be used
	if self.is_active() and forced_end == null:
		self.end = get_viewport().get_mouse_position()
		queue_redraw()
		self.length = calculate_lenght(end)
	elif self.is_active() and forced_end != null:
		self.end = forced_end
		queue_redraw()
		self.length = calculate_lenght(end)
	
func set_origin(point, p_max_length):
	origin = point
	self.max_length = p_max_length
	
func calculate_lenght(end_point)->float:
	return sqrt(((origin.coords.x - end_point.x)**2) + ((origin.coords.y - end_point.y)**2))
func reset_origin():
	length = 0
	origin=null
	queue_redraw()
