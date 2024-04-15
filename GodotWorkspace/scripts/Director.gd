extends Control

var points:Array[Point]
var edges:Array[Edge]
var current_point:Point
var current_phedge:Phedge

# Called when the node enters the scene tree for the first time.
func _ready():
	var point1 = $Point1
	var point2 = $Point2
		
	point1.activate("sillyguy", point1.global_position)
	point2.activate("fundude", point2.global_position)
	
	points.append(point1)
	points.append(point2)
	
	current_phedge = $phedge
	current_phedge.reset_origin()
	pass


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
			edges.append(edge)
			pass
	pass
	

func change_current_point(point):
	current_point = point
