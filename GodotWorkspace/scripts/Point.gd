extends AbstractPoint
class_name Point

var edges: Array[Edge]

func activate(point_name, point_coords):
	super(point_name, point_coords)
	$Area2D/icon.frame = 1

func _on_area_2d_mouse_entered():
	super()
	$Area2D/icon.frame = 2

func _on_area_2d_mouse_exited():
	super()
	if(edges.is_empty()):
		$Area2D/icon.frame = 1
	else:
		$Area2D/icon.frame = 0
	
func add_edge(edge:Edge) -> bool:
	for old_edge in edges:
		if old_edge.id == edge.id:
			return false
	$Area2D/icon.frame = 0
	edges.append(edge)
	return true

func remove_edge(edge:Edge) -> bool:
	var x = 0
	for old_edge in edges:
		if old_edge.id == edge.id:
			edges.remove_at(x)
			return true
		x = x + 1
	return false

func curr_frame()-> int:
	return $Area2D/icon.frame
	
func possible_edge(edge:Edge) -> bool:
	for old_edge in edges:
		if old_edge.id == edge.id:
			return false
	return true
