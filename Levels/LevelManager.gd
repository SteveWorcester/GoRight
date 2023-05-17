extends Node

var baseUrl = "res://Levels/"
var currentScene
signal eventLevelsSetSuccess

var currentStage
var currentLevel

@onready var partyLeader = get_parent().get_node("Party").get_child(0)

func _ready() -> void:
	pass

func load_level(stageNumber : int, levelNumber : int): #add storyteller
	if currentScene:
		currentScene.queue_free()
	var sceneUrl = levelSceneUrlBuilder(stageNumber, levelNumber)
	var scene = load(sceneUrl)
	currentScene = scene.instantiate()	
	add_child(currentScene)
	currentStage = stageNumber
	currentLevel = levelNumber
	currentScene.eventLevelsSetSuccess.connect(build_level_events)

func build_level_events():
	for event in currentScene.eventLevels:
		assert(currentScene.eventLevels[event] == null, "stage %s - level %s - %s level value is null!" % [currentStage, currentLevel, event])
	
	
	update_party_leader()

func levelSceneUrlBuilder(stageNumber : int, levelNumber : int) -> String:
	var stageUrl =  baseUrl + "Stage" + str(stageNumber) + "/"
	var levelUrl = stageUrl + "Level" + str(levelNumber) + "/"
	var sceneUrl = levelUrl + "S" + str(stageNumber) + "_L" + str(levelNumber) + ".tscn"	
	return sceneUrl

func update_party_leader():
	partyLeader = get_parent().get_node("Party").get_child(0)

func _on_event_levels_set_success():
	return true
