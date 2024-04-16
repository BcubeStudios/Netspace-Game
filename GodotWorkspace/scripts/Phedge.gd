extends Node2D
class_name Phedge

var origin: Point
var end: Vector2
var colour: Color = Color(255, 255, 255)
var id: String


func is_active():
	return origin != null

func color_change():
	pass

func _draw():
	if self.is_active():
		draw_line(origin.coords, end, colour)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#Insert displaying code, collect mouse position use it as endpoint, draw_line() can be used
	if self.is_active():
		end = get_viewport().get_mouse_position()
	pass
	
func set_origin(point):
	origin = point
	print("new origin")

func reset_origin():
	origin=null
	print("reset phedge")
