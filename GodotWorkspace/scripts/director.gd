extends Control

var point_scene = preload("res://scenes/point.tscn")
var end_point_scene = preload("res://scenes/end_point.tscn")
var variable_point_scene = preload("res://scenes/variable_point.tscn")

var points:Array[AbstractPoint]
var edges:Array[Edge]
var current_point:AbstractPoint
var current_phedge:Phedge
var length_left: float
var curr_length: float
var max_phedge: float = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	current_phedge = $phedge
	current_phedge.reset_origin()
	
	curr_length = 0

func createVariablePoint(new_name, coords, max_edges):
	var newPoint = variable_point_scene.instantiate()
	newPoint.activate(new_name, coords)
	newPoint.change_max_edges(max_edges)
	self.add_child(newPoint)
	points.append(newPoint)

func createEndPoint(new_name, coords):
	var newPoint = end_point_scene.instantiate()
	newPoint.activate(new_name, coords)
	self.add_child(newPoint)
	points.append(newPoint)


func createPoint(new_name, coords):
	var newPoint = point_scene.instantiate()
	newPoint.activate(new_name, coords)
	self.add_child(newPoint)
	points.append(newPoint)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	curr_length = current_phedge.length
	if current_point != null:
		current_phedge.forced_end = current_point.coords
	else:
		current_phedge.forced_end = null
	

func _input(event):
	if event is InputEventMouseButton and event.pressed and current_point == null:
		#reset phedge 
		current_phedge.reset_origin()
		curr_length = 0
	else:
		if event is InputEventMouseButton and event.pressed and !current_phedge.is_active() and current_point != null:
			#initalise phedge
			if current_point is EndPoint and current_point.edge != null:
				return
			current_phedge.set_origin(current_point, min(max_phedge, length_left))
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
						current_phedge.reset_origin()
						curr_length = 0
				else:
					current_phedge.reset_origin()


func change_current_point(point):
	current_point = point
	
func change_length_left(length: float) -> bool:
	var new_length = length_left - length
	if(new_length >= 0):
		length_left = new_length
		return true
	return false
	
func game_won() -> bool:	
	if edges.is_empty():
		return false	
	
	var connected_points:Array[AbstractPoint] = []
	connected_points.append(edges[0].point1)
	
	for point in connected_points:
		if point is EndPoint:
			if point.edge != null:
				if not (point.edge.point1 in connected_points):
					connected_points.append(point.edge.point1)
				if not (point.edge.point2 in connected_points):
					connected_points.append(point.edge.point2)
		else:
			for edge in point.edges:
				if not (edge.point1 in connected_points):
					connected_points.append(edge.point1)
				if not (edge.point2 in connected_points):
					connected_points.append(edge.point2)
	
	if connected_points.size() == points.size():
		#weve won so we can call the level to win 
		$"../../".level_won()
		return true
	return false

func auto_solve():
	var solved_points:Array[AbstractPoint] = []
	var remaining_points:Array[AbstractPoint] = points.duplicate()
	
	#first point random
	points.shuffle()
	solved_points.append(points[0])
	
	#remove from remaining
	remaining_points.erase(solved_points[0])
	
	var min_edge:Edge
	
	while(not self.game_won()):
		#find minimum edge
		min_edge = null
		for point in solved_points:
			for new_point in remaining_points:
				var edge = Edge.new(point, new_point)
				if min_edge == null:
					min_edge = edge
				if edge.length <= max_phedge and edge.length < min_edge.length  and change_length_left(edge.length)\
				 and point.possible_edge(edge) and new_point.possible_edge(edge):
					min_edge = edge
					change_length_left(-(edge.length))
		#add edge
		if min_edge != null and min_edge.length <= max_phedge and change_length_left(min_edge.length) \
		and min_edge.point1.add_edge(min_edge) and min_edge.point2.add_edge(min_edge):
			edges.append(min_edge)
			
			solved_points.append(min_edge.point2)
			remaining_points.erase(min_edge.point2)
			
			add_child(min_edge)
			#move to almost top
			move_child(min_edge, 1)
			#draw edge
			min_edge.queue_redraw()
			await Global.wait(0.5)

func reset():
	for point in points:
		for edge in edges:
			point.remove_edge(edge)
	edges.clear()
