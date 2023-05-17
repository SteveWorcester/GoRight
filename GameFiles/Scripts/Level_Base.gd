class_name Level_Base
extends Node2D

signal eventLevelsSetSuccess

var eventLevels = {
	"event_chance": null,
	"enemy_chance": null,
	"treasure_chance": null,
	"distance_per_chance_roll": null,
	"stage_length" : null
}

func _ready() -> void:
	pass

func setLevelsComplete():
	emit_signal("eventLevelsSetSuccess")
