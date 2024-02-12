extends CharacterBody2D

class_name VerticalWall

enum Direction {Left, Right}


func _physics_process(delta):
	pass

func _on_on_hit(direction):
	pass # Replace with function body.


func hit(direction: Direction):
	position.x = position.x + 10
