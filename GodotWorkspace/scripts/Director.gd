extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	var point1 = Point.new("point1", Vector2i(150, 150))
	add_child(point1) 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
