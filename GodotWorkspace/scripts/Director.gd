extends Control

var points:Array[Point]
var edges:Array[Edge]
var current_point:Point
var current_phedge:Phedge

# Called when the node enters the scene tree for the first time.
func _ready():
	#self.createPoint("point1", Vector2i(200, 200))
	#self.createPoint("point2", Vector2i(300, 150))
	var point = $Point
	var point2 = $Point2
	
	point.activate("point1", point.global_position)
	points.append(point)
	
	point2.activate("point2", point2.global_position)
	points.append(point2)
	
	current_phedge = $phedge
	current_phedge.reset_origin()
	pass


func createPoint(new_name, coords):
	var newPoint = Point.new()
	newPoint.activate(new_name, coords)
	self.add_child(newPoint)
	points.append(newPoint)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _input(event):
	if event is InputEventMouseButton and event.pressed and !current_phedge.is_active() and current_point != null:
		#initalise phedge
		current_phedge.set_origin(current_point)
		pass
	else:
		if event is InputEventMouseButton and event.pressed and current_phedge.is_active() and current_point != null:
			#new edge
			var edge = Edge.new(current_phedge.origin, current_point)
			print("edge made")
			#reset phedge 
			current_phedge.reset_origin()
			#add edge to array
			add_child(edge)
			#move to almost top
			move_child(edge, 1)
			edges.append(edge)
			pass
	pass
	

func change_current_point(point):
	current_point = point
