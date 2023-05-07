extends CanvasLayer

@onready var baseGame = get_parent().get_node("BaseGame")
@onready var mainMenuBackground = get_parent().get_node("ARContainer")
@onready var mainMenuUi = get_parent().get_node("Actions")

@onready var mainMenuGroup = get_tree().get_nodes_in_group("mainMenu")
@onready var baseGameGroup = get_tree().get_nodes_in_group("baseGame")

func _ready() -> void:
	pass

func _on_start_game_button_up() -> void:
	for node in baseGameGroup:
		if "visible" in node:
			node.visible = false
	
	for node in baseGameGroup:
		if "visible" in node:
			node.visible = true
	
	baseGame.startGame()
	pass

func _on_load_game_pressed() -> void:
	pass # Replace with function body.


func _on_options_pressed() -> void:
	pass # Replace with function body.


func _on_nothing_pressed() -> void:
	pass # Replace with function body.



