extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	var point1 = createPoint("point1", Vector2i(150, 150))
	var point2 = createPoint("point2", Vector2i(300, 150))
	var edge = createEdge(point1, point2)
	pass # Replace with function body.

func createEdge(point1, point2) -> Edge:
	var newEdge = Edge.new(point1, point2)
	add_child(newEdge)
	return newEdge

func createPoint(name, coords) -> Point:
	var newPoint = Point.new(name, coords)
	add_child(newPoint)
	return newPoint

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
