extends Node

var baseUrl = "res://Levels/"
var currentScene
@onready var gameController = get_parent().get_node("GameController")

func _ready() -> void:
	pass

func load_level(stageNumber, levelNumber):
	if currentScene:
		currentScene.queue_free()
		
	var stageUrl =  baseUrl + "Stage" + str(stageNumber) + "/"
	var levelUrl = stageUrl + "Level" + str(levelNumber) + "/"
	var sceneUrl = levelUrl + "S" + str(stageNumber) + "_L" + str(levelNumber) + ".tscn"
	var scene = load(sceneUrl)
	currentScene = scene.instantiate()
	add_child(currentScene)
