extends Area2D

@export var isPlayerLimiterArea = true
@onready var player_ball_spawner = %PlayerBallSpawner
@onready var enemy_ball_spawner = %EnemyBallSpawner

func _on_body_entered(body):
	if body is Ball:
		if isPlayerLimiterArea and body.isEnemyBall:
			enemy_ball_spawner.spawn(true)
			body.setIsEnemy(false)
		if !isPlayerLimiterArea and !body.isEnemyBall:
			player_ball_spawner.spawn(false)
			body.setIsEnemy(true)

