extends Area2D

class_name OutZone

@export var isPlayerOutZone: bool
@onready var ui = %UI as UI

func _on_body_entered(body):
	if !body is Ball:
		return

	if isPlayerOutZone:
		ui.updateEnemyScore(1)
	else:
		ui.updatePlayerScore(1)

	body.reset()
