extends Node

@onready var baseGameGroup = get_tree().get_nodes_in_group("baseGame")
@onready var party = $BaseGame/GameController/Party

func _ready() -> void:
	for node in baseGameGroup:
		if "visible" in node:
			node.visible = false
	main_menu_camera()

func main_menu_camera() -> void:
	var cam = load("res://GameFiles/BaseGame/player_cam.tscn")
	var camera = cam.instantiate()
	add_child(camera)
	
	camera.make_current()
	camera.set_anchor_mode(0) 
	camera.add_to_group("mainMenu")
