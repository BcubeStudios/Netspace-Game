extends Node

var Colours = {"red" = Color(0.671, 0, 0), "blue" = Color(0.078, 0.122, 0.988),  "green" = Color(0, 1, 0.094), "black" = Color(0, 0, 0)}

var First_time:bool = true

func wait(duration):  
	await get_tree().create_timer(duration, false, false, true).timeout
