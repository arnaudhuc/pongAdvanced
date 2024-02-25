extends Area2D

@export var isPlayerLimiterArea = true
@onready var player_ball_spawner = %PlayerBallSpawner
@onready var enemy_ball_spawner = %EnemyBallSpawner

func _on_body_entered(body):
	if body is Ball:
		var ball = body
		if isPlayerLimiterArea and ball.isEnemyBall:
			enemy_ball_spawner.spawn(true)
			ball.setIsEnemy(false)
		if !isPlayerLimiterArea and !ball.isEnemyBall:
			player_ball_spawner.spawn(false)
			ball.setIsEnemy(true)
			
	if body is VerticalWall:
		var vWall = body
		vWall.collideWithLimiter()
