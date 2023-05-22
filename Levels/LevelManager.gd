extends Node

var baseUrl = "res://Levels/"
var currentScene
signal eventLevelsSetSuccess

var currentStage
var currentLevel

@onready var event = preload("res://GameFiles/Enums/EventLevel.gd")
@onready var partyLeader = get_parent().get_node("Party").get_child(0)

func _ready() -> void:
	pass

func load_level(stageNumber : int, levelNumber : int): #add storyteller
	if currentScene:
		currentScene.queue_free()
	currentStage = stageNumber
	currentLevel = levelNumber
	var sceneUrl = levelSceneUrlBuilder(currentStage, currentLevel)
	var scene = load(sceneUrl)
	currentScene = scene.instantiate()
	add_child(currentScene)

func build_level_events():
	print("build_level_events() called...")
	#event_chance,
	#enemy_chance,
	#treasure_chance,
	#distance_per_chance_roll,
	#stage_length
	var sumOfRollValues = currentScene.eventLevels[event.level.enemy_chance] + currentScene.eventLevels[event.level.treasure_chance] + currentScene.eventLevels[event.level.event_chance]
	for event in currentScene.eventLevels:
		assert(currentScene.eventLevels[event] != null, "stage %s - level %s - EventLevel enum %s  is null!" % [currentStage, currentLevel, event])
	for i in range(0,currentScene.eventLevels[event.level.stage_length], currentScene.eventLevels[event.level.distance_per_chance_roll]):
		var eventRoll = randi() % sumOfRollValues
		var rollResult = get_roll_result(eventRoll)
		match rollResult: 
			event.level.event_chance:
				print("event")
			event.level.enemy_chance:
				print("combat!")
			event.level.treasure_chance:
				print("treasure!")
			event.level.none:
				print("no event")
				continue
		pass
	update_party_leader()

func get_roll_result(eventRoll : int) -> int:
	var eventMin : int = 0
	var eventMax : int
	var isEvent : bool
	
	for eventName in currentScene.eventLevels:
		isEvent = eventName != event.level.distance_per_chance_roll && eventName != event.level.stage_length
		eventMax = eventMin + currentScene.eventLevels[eventName]
		if !isEvent:
			print("skipping %s as intended..." % eventName)
			pass # NOP
		elif eventRoll > eventMin && eventRoll < eventMax:
			return eventName
		
		if isEvent:
			eventMin = eventMax
	print("get_roll_result() failure. event roll: %s; event min: %s; event max: %s; values: " % [eventRoll, eventMin, eventMax])
	for event in currentScene.eventLevels: 
		print("%s: %s" % [event, currentScene.eventLevels[event]])
	return event.level.none

func levelSceneUrlBuilder(stageNumber : int, levelNumber : int) -> String:
	var stageUrl =  baseUrl + "Stage" + str(stageNumber) + "/"
	var levelUrl = stageUrl + "Level" + str(levelNumber) + "/"
	var sceneUrl = levelUrl + "S" + str(stageNumber) + "_L" + str(levelNumber) + ".tscn"	
	return sceneUrl

func update_party_leader():
	partyLeader = get_parent().get_node("Party").get_child(0)

func connect_stage_signal():
	currentScene.eventLevelsSetSuccess.connect(build_level_events)
	print("signal connected to build_level_events()")
