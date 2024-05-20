extends Panel

@onready var length_label = $cablePanel/length_Label
@onready var curr_length_label = $currCablePanel/curr_length_Label

func _process(_delta):
	length_label.text = str(int($Director.length_left))
	curr_length_label.text = str(int($Director.curr_length))


func _on_solve_button_pressed():
	$resetButton.hide()
	$solveButton.hide()
	$Director.auto_solve()

func _on_reset_button_pressed():
	$Director.reset()
