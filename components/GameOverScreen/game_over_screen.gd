extends CanvasLayer

class_name GameOverScreen

@export var ui: UI
@export var vWalls: Array[VerticalWall]

func _on_button_pressed():
	ui.reset()
	visible = false
	for vwall in vWalls:
		vwall.reset()

func displayScreen():
	visible= true
