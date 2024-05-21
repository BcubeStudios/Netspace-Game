extends Point
class_name VariablePoint

var max_edges:int = 0

func activate(p_point_name, p_point_coords):
	super(p_point_name, p_point_coords)

func add_edge(edge:Edge) -> bool:
	if edge.point1 == edge.point2:
		return false
	if edges.size() >= max_edges:
		return false
	for old_edge in edges:
		if old_edge.id == edge.id:
			return false
	edges.append(edge)
	redraw()
	return true

func possible_edge(edge:Edge) -> bool:
	if edge.point1 == edge.point2:
		return false
	if edges.size() >= max_edges:
		return false
	for old_edge in edges:
		if old_edge.id == edge.id:
			return false
	return true
	
func change_max_edges(amount: int):
	if (amount <1 or amount > 10 ):
		return
	max_edges = amount
	
func redraw():
	if(edges.is_empty()):
		$Area2D/sprite.frame = 1
	else:
		if edges.size() == max_edges:
			$Area2D/sprite.frame = 3
		else:
			$Area2D/sprite.frame = 0

func curr_frame()-> int:
	if edges.size() == max_edges:
		return 0
	return $Area2D/sprite.frame
