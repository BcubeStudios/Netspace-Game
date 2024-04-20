extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$BGPanel/Panel1.show()
	$BGPanel/Panel2.hide()
	$BGPanel/Panel3.hide()
	$BGPanel/Panel4.hide()
	pass # Replace with function body.

func _on_skip_button_pressed():
	$".".hide()

func _on_continue_button_1_pressed():
	$BGPanel/Panel2.show()
	$BGPanel/Panel1.hide()

func _on_continue_button_2_pressed():
	$BGPanel/Panel3.show()
	$BGPanel/Panel2.hide()

func _on_continue_button_3_pressed():
	$BGPanel/Panel4.show()
	$BGPanel/Panel3.hide()

func _on_continue_button_4_pressed():
	$".".hide()
