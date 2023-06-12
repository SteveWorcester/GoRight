extends Node

@onready var levelManager = $GameController/LevelManager
@onready var gameController = $GameController
@onready var party = $GameController/Party
@onready var hud = $GameController/Hud

func load_game(saveFileName) -> bool:
	var realDirectory = OS.get_user_data_dir()
	var loadGameUrl = "user://%s".format([saveFileName])
	if not FileAccess.file_exists(loadGameUrl):
		print("filename %s not found in %s.".format([saveFileName, realDirectory]))
		return false
	
	var save_nodes = get_tree().get_nodes_in_group("saveGameItem") #group not set up yet
	var fileString = FileAccess.get_file_as_string(loadGameUrl)
	var fileDict = JSON.parse_string(fileString) 
	return true
	pass

func save_game(saveFileName : String):
	var save_game = FileAccess.open("user://%s".format([saveFileName]), FileAccess.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("Savegame")
	for node in save_nodes:
		# Check the node is an instanced scene so it can be instanced again during load.
		#is this wrong?
		if node.scene_file_path.is_empty():
			print("node '%s' is not an instanced scene, skipped" % node.name)
			continue
			
		if !node.has_method("save"):
			print("node '%s' is missing a save() function, skipped" % node.name)
			continue
			
		var node_data = node.call("save")
		var json_string = JSON.stringify(node_data)
		save_game.store_line(json_string)
	pass

func startGame():	
	levelManager.load_level(1,1)
	make_baseGame_visible(true)

func make_baseGame_visible(makeVisible : bool):
	var baseGameGroup = get_tree().get_nodes_in_group("baseGame")
	var mainMenuGroup = get_tree().get_nodes_in_group("mainMenu")
	for node in baseGameGroup:
		if "visible" in node:
			node.visible = makeVisible
	for node in mainMenuGroup:
		if "visible" in node:
			node.visible = !makeVisible
	party.switch_camera_to_party_leader()
