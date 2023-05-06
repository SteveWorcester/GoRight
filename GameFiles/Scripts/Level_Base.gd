extends Node2D

var randomEncounterPercent : int = 100
var randomEncounterDistanceInPx : int = 100

@onready var party = $Party
var distanceCounter = 0
var partyLeader : CharacterBody2D

func _ready() -> void:
	partyLeader = party.get_child(0)

func setPartyLeader(newPartyLeader):
	partyLeader = newPartyLeader

func roll_for_encounter() -> bool:
	var rand = randi_range(1,100)
	if rand >= randomEncounterPercent:
		return true
	return false

func reset_distance_counter():
	distanceCounter = 0

func change_enounter_percent(changePercent : int):
	randomEncounterPercent += changePercent

func change_encounter_distance(changeDistance : int):
	randomEncounterDistanceInPx += changeDistance
