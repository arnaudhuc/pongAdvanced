extends RigidBody2D

@export var speed = 200

func _physics_process(_delta):
	var movement = Vector2.ZERO
	if Input.is_action_pressed("up"):
		movement = Vector2.UP
	
	if Input.is_action_pressed("down"):
		movement = Vector2.DOWN
	
	linear_velocity = movement * speed
