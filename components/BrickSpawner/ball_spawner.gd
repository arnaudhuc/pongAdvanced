extends Node2D

@export var ball_scene: PackedScene
@export var isEnemySpawner = false

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn(isEnemySpawner)

func spawn(isEnemy: bool):
	var ball = ball_scene.instantiate() as Ball
	if isEnemy:
		ball.setIsEnemy(true)
	ball.set_position(Vector2.ZERO)
	add_child(ball)
