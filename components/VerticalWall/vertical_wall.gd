extends CharacterBody2D

class_name VerticalWall

enum Direction {Left, Right}

func _physics_process(delta):
	pass

func hit(direction: Direction):
	position.x += 1
	print("hit")
