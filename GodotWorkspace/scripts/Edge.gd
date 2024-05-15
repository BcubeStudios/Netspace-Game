extends Node2D
class_name Edge

@onready var director = $"../"
@onready var collision_shape_2d = $Area2D/CollisionShape2D

var point1: AbstractPoint
var point2: AbstractPoint
var colour: Color = Global.Colours["black"]
var id: String
var length: float = 0


func _on_area_2d_mouse_entered():
	director.change_pointing_at(self)
	print("enter")

func _on_area_2d_mouse_exited():
	director.change_pointing_at(null)
	print("exit")

func activate(new_point1, new_point2):
	self.point1 = new_point1
	self.point2 = new_point2
	
	self.id = str(max(point1.coords.x, point2.coords.x))+ \
	str(min(point1.coords.x, point2.coords.x)) + str(max(point1.coords.y, point2.coords.y)) +\
	str(min(point1.coords.y, point2.coords.y))
	self.length = sqrt(((point1.coords.x - point2.coords.x)**2) + ((point1.coords.y - point2.coords.y)**2))
	
	#collision_shape_2d.shape.a = new_point1.coords
	#collision_shape_2d.shape.a = new_point1.coords
	

func color_change():
	pass

func _draw():
	draw_line(point1.coords, point2.coords, colour, 4)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
