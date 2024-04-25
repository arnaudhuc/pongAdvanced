extends CharacterBody2D

class_name VerticalWall

@onready var sprite_2d = $Sprite2D

enum Direction {LEFT, RIGHT}

var last_ball_touch: Ball

const ENEMY_WALL = preload("res://assets/enemyWall.jpg")
const PLAYER_WALL = preload("res://assets/playerWall.jpg")
const NEUTRAL_WALL = preload("res://assets/neutralWall.jpg")
var initialPosition: Vector2

func _ready():
	sprite_2d.texture = NEUTRAL_WALL
	initialPosition = position

func hit(direction: Direction, power: int, ball: Ball):
	if direction == Direction.LEFT:
		position.x += 10 * power
		sprite_2d.texture = PLAYER_WALL
	else:
		position.x -= 10 * power
		sprite_2d.texture = ENEMY_WALL

	last_ball_touch = ball

func collideWithLimiter():
	last_ball_touch.upBallPower()
	queue_free()

func reset():
	position = initialPosition
	sprite_2d.texture = NEUTRAL_WALL
