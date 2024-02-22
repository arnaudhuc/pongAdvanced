extends Paddle

func _physics_process(_delta):
	var movement = Vector2.ZERO
	if Input.is_action_pressed("enemy_up"):
		movement = Vector2.UP

	if Input.is_action_pressed("enemy_down"):
		movement = Vector2.DOWN

	linear_velocity = movement * speed
