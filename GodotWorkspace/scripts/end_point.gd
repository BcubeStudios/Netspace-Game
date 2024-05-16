extends AbstractPoint
class_name EndPoint

var edge:Edge

func activate(p_point_name, p_point_coords):
	super(p_point_name, p_point_coords)
	edge = null
	$Area2D/sprite.frame = 1

func _on_area_2d_mouse_entered():
	super()
	$Area2D/sprite.frame = 2

func _on_area_2d_mouse_exited():
	super()
	if(edge == null):
		$Area2D/sprite.frame = 1
	else:
		$Area2D/sprite.frame = 0
	
func add_edge(p_edge:Edge) -> bool:
	if p_edge.point1 == p_edge.point2:
		return false
	if edge == null:
		edge = p_edge
		$Area2D/sprite.frame = 0
		return true
	return false

func remove_edge(p_edge:Edge) -> bool:
	if(p_edge.id == edge.id):
		edge = null
		return true
	else:
		return false

func curr_frame()-> int:
	return $Area2D/sprite.frame

func possible_edge(p_edge:Edge) -> bool:
	if p_edge.point1 == p_edge.point2:
		return false
	return edge == null

func redraw():
	if(edge == null):
		$Area2D/sprite.frame = 1
	else:
		$Area2D/sprite.frame = 0

