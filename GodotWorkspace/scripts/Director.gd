extends Control

var point_scene = preload("res://scenes/point.tscn")

var points:Array[Point]
var edges:Array[Edge]
var current_point:Point
var current_phedge:Phedge

# Called when the node enters the scene tree for the first time.
func _ready():
	self.createPoint("point1", Vector2i(650, 150))
	self.createPoint("point2", Vector2i(300, 350))
	self.createPoint("point3", Vector2i(500, 300))
	
	current_phedge = $phedge
	current_phedge.reset_origin()
	
	for _i in self.get_children():
		print(_i)
	pass


func createPoint(new_name, coords):
	var newPoint = point_scene.instantiate()
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
		if event is InputEventMouseButton and event.pressed and current_phedge.is_active():
			if current_point != null:
				#new edge
				var edge = Edge.new(current_phedge.origin, current_point)
				if(current_phedge.origin.add_edge(edge) and current_point.add_edge(edge)):
					print("edge made")
					#reset phedge 
					current_phedge.reset_origin()
					#add edge to array
					add_child(edge)
					#move to almost top
					move_child(edge, 1)
					edges.append(edge)
				else:
					#reset phedge 
					current_phedge.reset_origin()
			else:
				if current_point == null:
					#reset phedge 
					current_phedge.reset_origin()
			pass
	pass
	

func change_current_point(point):
	current_point = point
