extends AbstractPoint
class_name EndPoint

var edge:Edge

func activate(point_name, point_coords):
	super(point_name, point_coords)
	edge = null
	$Area2D/icon.frame = 1

func _on_area_2d_mouse_entered():
	super()
	$Area2D/icon.frame = 2

func _on_area_2d_mouse_exited():
	super()
	if(edge == null):
		$Area2D/icon.frame = 1
	else:
		$Area2D/icon.frame = 0
	
func add_edge(p_edge:Edge) -> bool:
	if edge == null:
		edge = p_edge
		$Area2D/icon.frame = 0
		return true
	return false

func remove_edge(_p_edge:Edge) -> bool:
	edge = null
	return true

func curr_frame()-> int:
	return $Area2D/icon.frame

