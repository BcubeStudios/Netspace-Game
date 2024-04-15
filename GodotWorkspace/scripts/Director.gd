extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	var point1 = Point.new("point1", Vector2i(150, 150))
	var point2 = Point.new("point2", Vector2i(300, 150))
	add_child(point1) 
	add_child(point2)
	CreateEdge(point1, point2)
	pass # Replace with function body.

func CreateEdge(point1, point2):
	var newEdge = Edge.new(point1, point2)
	add_child(newEdge)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
