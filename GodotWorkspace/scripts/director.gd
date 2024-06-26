extends Control

var point_scene = preload("res://scenes/point.tscn")
var end_point_scene = preload("res://scenes/end_point.tscn")
var edge_scene = preload("res://scenes/edge.tscn")
var variable_point_scene = preload("res://scenes/variable_point.tscn")

var points:Array[AbstractPoint]
var edges:Array[Edge]
var current_point:AbstractPoint
var current_edge:Edge
var current_phedge:Phedge
var max_length: float
var length_left: float
var curr_length: float
var max_phedge: float = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	current_phedge = $thisPhedge
	current_phedge.reset_origin()
	
	curr_length = 0

func set_cable_length(length):
	max_length = length
	length_left = length

func create_variable_point(new_name, coords, max_edges):
	var newPoint = variable_point_scene.instantiate()
	newPoint.activate(new_name, coords)
	newPoint.change_max_edges(max_edges)
	self.add_child(newPoint)
	points.append(newPoint)

func create_end_point(new_name, coords):

	var newPoint = end_point_scene.instantiate()
	newPoint.activate(new_name, coords)
	self.add_child(newPoint)
	points.append(newPoint)


func create_point(new_name, coords):
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
	if event is InputEventMouseButton and event.pressed and current_point == null and current_phedge.is_active():
		# reset phedge 
		current_phedge.reset_origin()
		curr_length = 0
	elif event is InputEventMouseButton and event.pressed and !current_phedge.is_active() and current_point != null:
		# initalise phedge
		if current_point is EndPoint and current_point.edge != null:
			return
		current_phedge.set_origin(current_point, min(max_phedge, length_left))
	elif event is InputEventMouseButton and event.pressed and current_phedge.is_active():
		if current_point != null and current_phedge.is_valid(current_point.coords):
			# try to create edge
			create_edge(current_phedge.origin, current_point)
		else:
			current_phedge.reset_origin()
	elif event is InputEventMouseButton and event.get_button_index() == 2 and event.pressed and current_edge != null:
		delete_edge(current_edge)


func change_pointing_at(node):
	if node is AbstractPoint:
		self.current_point = node
	elif node is Edge:
		self.current_edge = node
	else:
		self.current_edge = node
		self.current_point = node

func create_edge(point1, point2):
	var edge = edge_scene.instantiate()
	edge.activate(point1, point2)
	# check if the edge would be valid
	if(current_phedge.origin.possible_edge(edge) and current_point.possible_edge(edge) and change_length_left(edge.length)):
		#add to edges
		current_phedge.origin.add_edge(edge)
		current_point.add_edge(edge)
		# reset phedge 
		current_phedge.reset_origin()
		# add edge to array
		add_child(edge)
		# move to almost top
		move_child(edge, 1)
		edges.append(edge)
		game_won()
	# abort edge creation if not valid
	else:
		# fully remove edge from its points
		edge.queue_free()
		# reset phedge
		current_phedge.reset_origin()
		curr_length = 0

func delete_edge(edge):
	# unlink edge from both it's points
	edge.point1.remove_edge(edge)
	edge.point2.remove_edge(edge)
	#reset edge look
	edge.point1.redraw()
	edge.point2.redraw()
	# refund used length
	change_length_left(-edge.length)
	# remove edge from the director
	remove_child(edge)
	edges.erase(edge)
	edge.queue_free()


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
		# we've won so we can call the level to win 
		$"../../".level_won()
		return true
	return false

func auto_solve():
	self.reset()
	await Global.wait(0.5)
	
	var solved_points:Array[AbstractPoint] = []
	var remaining_points:Array[AbstractPoint] = points.duplicate()
	
	# first point random
	points.shuffle()
	solved_points.append(points[0])
	
	# remove from remaining
	remaining_points.erase(solved_points[0])
	
	var min_edge:Edge
	
	while(not self.game_won()):
		# find minimum edge
		min_edge = null
		for point in solved_points:
			for new_point in remaining_points:
				var edge = edge_scene.instantiate()
				edge.activate(point, new_point)
				if not (new_point is EndPoint and point is EndPoint):
					if min_edge == null:
						min_edge = edge
					if edge.length <= max_phedge and edge.length < min_edge.length  and new_point.possible_edge(edge)\
					 and point.possible_edge(edge) and (length_left - edge.length >= 0):
						min_edge = edge
		# add edge
		if min_edge != null and min_edge.length <= max_phedge and change_length_left(min_edge.length) \
		and min_edge.point1.add_edge(min_edge) and min_edge.point2.add_edge(min_edge):
			edges.append(min_edge)
			
			solved_points.append(min_edge.point2)
			remaining_points.erase(min_edge.point2)
			
			add_child(min_edge)
			# move to almost top
			move_child(min_edge, 1)
			# draw edge
			min_edge.queue_redraw()
			await Global.wait(0.5)

func reset():
	for point in points:
		for edge in edges:
			point.remove_edge(edge)
		point.redraw()
	for edge in edges:
		edge.queue_free()
	edges.clear()
	length_left = max_length
