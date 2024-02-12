extends CharacterBody2D

class_name Player_Ball

@export var INITIAL_BALL_SPEED = 10
@export var speed_multiplier = 1.02

var ball_speed = INITIAL_BALL_SPEED

func _ready():
	start_ball()

func _physics_process(delta):
	var collision = move_and_collide(velocity * ball_speed * delta, false, false, true)

	if(collision):
	# change direction
		velocity =  velocity.bounce(collision.get_normal()) * speed_multiplier

	if(collision && collision.get_collider().name == "VerticalWall"):
		collision.get_collider().call('hit', VerticalWall.Direction.Right)

func start_ball():
	randomize()
	velocity.x = [-1, 1][randi() % 2] * INITIAL_BALL_SPEED
	velocity.y = [-.8, .8][randi() % 2] * INITIAL_BALL_SPEED
