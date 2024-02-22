extends RigidBody2D

class_name Paddle

@export var speed = 500
@onready var collision_shape_2d = $CollisionShape2D


func _physics_process(_delta):
	var movement = Vector2.ZERO
	if Input.is_action_pressed("player_up"):
		movement = Vector2.UP

	if Input.is_action_pressed("player_down"):
		movement = Vector2.DOWN

	linear_velocity = movement * speed

func get_size():
	return collision_shape_2d.shape.get_rect().size

func get_height():
	return get_size().y

