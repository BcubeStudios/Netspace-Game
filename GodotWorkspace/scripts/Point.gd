extends Node2D
class_name Point

var pointName: String
var coords: Vector2i
var edges: Array[Edge]

# Called when the node enters the scene tree for the first time.
func _ready():
	print(pointName)
	pass # Replace with function body.

func _init(name, coords):
	self.pointName = name
	self.coords = coords


func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			do_right_click()
		if event.button_index == MOUSE_BUTTON_LEFT:
			do_left_click()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func do_right_click():
	print("right")
	pass

func do_left_click():
	print("left")
	pass

func _draw():
	draw_circle(coords, 12, Global.Colours["red"])
	pass
