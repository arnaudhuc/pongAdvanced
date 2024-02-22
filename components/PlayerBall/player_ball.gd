extends CharacterBody2D

class_name Ball

@export var INITIAL_BALL_SPEED = 10
@export var speed_multiplier = 1.02
@export var isEnemyBall = false
@onready var collision_shape_2d = $CollisionShape2D

var ball_speed = INITIAL_BALL_SPEED
var speed_up_factor = 1.05
var start_position: Vector2
var last_collider_id

const VELOCITY_LIMIT = 40

func _ready():
	start_ball()
	start_position = position

func _physics_process(delta):
	var collision = move_and_collide(velocity * ball_speed * delta, false, false, true)
	if(!collision):
		return

	var collider = collision.get_collider()
	if (collider is Paddle):
		ball_collision(collider)
	else:
		velocity = velocity.bounce(collision.get_normal())

	if(collider is VerticalWall):
		if isEnemyBall:
			collider.call('hit', VerticalWall.Direction.RIGHT)
		else :
			collider.call('hit', VerticalWall.Direction.LEFT)


func start_ball():
	randomize()
	velocity.x = [-1, 1][randi() % 2] * INITIAL_BALL_SPEED
	velocity.y = [-.8, .8][randi() % 2] * INITIAL_BALL_SPEED

func ball_collision(collider):
	var ball_center_x = position.x
	var collider_height = collider.get_height()
	var collider_center_y = collider.position.y
	var velocity_xy = velocity.length()
	var collision_y = absf(ball_center_x - collider_center_y) / (collider_height / 2)
	var new_velocity = Vector2.ZERO

	new_velocity.y = velocity_xy * collision_y

	new_velocity.x = sqrt(absf(velocity_xy * velocity_xy - new_velocity.y * new_velocity.y)) * (-1 if velocity.x > 0 else 1)

	velocity = (new_velocity * speed_up_factor).limit_length(VELOCITY_LIMIT)

func reset():
	position = start_position
	start_ball()

func setIsEnemy(value: bool):
	isEnemyBall = value
