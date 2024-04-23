extends Control

var point_scene = preload("res://scenes/point.tscn")

var points:Array[Point]
var edges:Array[Edge]
var current_point:Point
var current_phedge:Phedge
var length_left: float
var curr_length: float

# Called when the node enters the scene tree for the first time.
func _ready():
	self.createPoint("point1", Vector2i(700, 100))
	self.createPoint("point2", Vector2i(950, 500))
	self.createPoint("point3", Vector2i(500, 500))
	self.createPoint("point4", Vector2i(700, 300))
	self.createPoint("point5", Vector2i(700, 500))
	
	current_phedge = $phedge
	current_phedge.reset_origin()
	
	length_left = 1000
	curr_length = 0


func createPoint(new_name, coords):
	var newPoint = point_scene.instantiate()
	newPoint.activate(new_name, coords)
	self.add_child(newPoint)
	points.append(newPoint)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	curr_length = current_phedge.length
	if current_point != null:
		current_phedge.forcedEnd = current_point.coords
	else:
		current_phedge.forcedEnd = null
	

func _input(event):
	if event is InputEventMouseButton and event.pressed and current_point == null:
		#reset phedge 
		current_phedge.reset_origin()
		curr_length = 0
	else:
		if event is InputEventMouseButton and event.pressed and !current_phedge.is_active() and current_point != null:
			#initalise phedge
			current_phedge.set_origin(current_point)
		else:
			if event is InputEventMouseButton and event.pressed and current_phedge.is_active():
				if current_point != null and current_phedge.is_valid(current_point.coords):
					#new edge
					var edge = Edge.new(current_phedge.origin, current_point)
					if(current_phedge.origin.add_edge(edge) and current_point.add_edge(edge) and change_length_left(edge.length)):
						#reset phedge 
						current_phedge.reset_origin()
						#add edge to array
						add_child(edge)
						#move to almost top
						move_child(edge, 1)
						edges.append(edge)
						game_won()
					else:
						#reset phedge 
						edge.point1.remove_edge(edge)
						edge.point2.remove_edge(edge)
						current_phedge.reset_origin()
						curr_length = 0
				else:
					current_phedge.reset_origin()
	pass

func change_current_point(point):
	current_point = point
	
func change_length_left(length: float) -> bool:
	var new_length = length_left - length
	if(new_length >= 0):
		length_left = new_length
		return true
	return false
	
func game_won():
	#insert win conditions
	if edges.size() == 4:
		$"../../".level_won()
	else:
		pass
	

func auto_solve():
	pass
