extends Node

enum classes {
	Axemaster
}

@onready var camera = preload("res://GameFiles/BaseGame/player_cam.tscn")
var currentCam



func _ready() -> void:
	switch_camera_to_party_leader()
	pass

func switch_camera_to_party_leader() -> void:
	if currentCam:
		currentCam.queue_free()
	var characters = get_children()
	for character in characters:
		if character is CharacterBody2D:
			currentCam = camera.instantiate()
			character.add_child(currentCam)
			currentCam.make_current()
			break

func add_party_member(classToAdd : classes) -> bool:
	if (get_child_count() >= 4):
		party_error("Too many members in the party.")
		return false
	
	return true

func remove_party_member(indexToRemove : int) -> bool:
	if (get_child_count() <= 1):
		party_error("Cannot remove any more players from your party.")
		return false
	get_child(indexToRemove).queue_free()
	return true

func party_error(outputText):
	pass
