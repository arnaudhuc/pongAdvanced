extends CharacterBody2D

class_name VerticalWall

enum Direction {LEFT, RIGHT}

func hit(direction: Direction):
	if direction == Direction.LEFT:
		position.x += 10
	else:
		position.x -= 10
