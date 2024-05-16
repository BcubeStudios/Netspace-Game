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
	$Area2D/sprite.frame = 0
	edges.append(edge)
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
