extends Node2D
class_name Edge

@onready var director = $"../"
var collision_shape_2d : CollisionShape2D

var point1: AbstractPoint
var point2: AbstractPoint
var colour: Color = Global.Colours["black"]
var id: String
var length: float = 0


func _on_area_2d_mouse_entered():
	director.change_pointing_at(self)

func _on_area_2d_mouse_exited():
	director.change_pointing_at(null)

func activate(new_point1, new_point2):
	# saving the start and end point
	self.point1 = new_point1
	self.point2 = new_point2
	
	# getting the collision shape
	collision_shape_2d = $Area2D/CollisionShape2D
	
	# making sure the origin of the drawn line is on the starting point and that the collision shape is properly 
	position = new_point1.coords
	collision_shape_2d.position = Vector2((new_point1.coords.x + new_point2.coords.x)/2, (new_point1.coords.y + new_point2.coords.y)/2) - position
	
	# creating id and calculating the length of the edge
	self.id = str(max(point1.coords.x, point2.coords.x))+ \
	str(min(point1.coords.x, point2.coords.x)) + str(max(point1.coords.y, point2.coords.y)) +\
	str(min(point1.coords.y, point2.coords.y))
	self.length = sqrt(((point1.coords.x - point2.coords.x)**2) + ((point1.coords.y - point2.coords.y)**2))
	
	# building the hitbox
	collision_shape_2d.shape.size = Vector2(10, length)
	collision_shape_2d.look_at(new_point2.coords)
	collision_shape_2d.rotate(PI/2)

func _draw():
	draw_line(Vector2i(0,0), point2.coords-point1.coords, colour, 4)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

