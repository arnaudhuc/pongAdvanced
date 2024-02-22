extends Node

class_name UI

@onready var enemy_score_label = $EnemyScoreLabel
@onready var player_score_label = $PlayerScoreLabel
var player_score = 0
var enemy_score = 0

func _ready():
	updateEnemyScore(enemy_score)
	updatePlayerScore(player_score)

func updatePlayerScore(score: int):
	player_score = player_score + score
	player_score_label.text = "%d" % player_score

func updateEnemyScore(score: int):
	enemy_score = enemy_score + score
	enemy_score_label.text = "%d" % enemy_score
