class_name Level_Base
extends Node2D

@onready var gameController = get_parent().get_parent().get_node("GameController")

var eventLevels = {
	"event_chance": null,
	"enemy_chance": null,
	"trasure_chance": null,
	"distance_per_chance_roll": null,
	"stage_length" : null
}

func _ready() -> void:
	pass
