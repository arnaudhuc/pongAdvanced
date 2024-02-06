extends CharacterBody2D

class_name VerticalWall

func _physics_process(delta):
	var collider = move_and_collide(Vector2.ZERO)

	print(collider)
