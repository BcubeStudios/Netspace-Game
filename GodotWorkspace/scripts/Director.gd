extends Control

var points:Array[Point]
var edges:Array[Edge]

# Called when the node enters the scene tree for the first time.
func _ready():
	var point1 = $Point1
	var point2 = $Point2
	
	point1.activate("sillyguy", point1.global_position)
	point2.activate("fundude", point2.global_position)
	
	points.append(point1)
	points.append(point2)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	get_viewport().get_mouse_position()
	pass

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		# check if its inside the shape
		for point in points:
			if point.isInside()
	pass
