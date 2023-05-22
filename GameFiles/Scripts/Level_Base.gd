class_name Level_Base
extends Node2D

signal eventLevelsSetSuccess
@onready var event = preload("res://GameFiles/Enums/EventLevel.gd")

var eventLevels : Dictionary

func _ready() -> void:
#	create_event_levels_dictionary()
	pass

func setLevelsComplete():
	#await get_tree().process_frame
	var levelManager = get_parent()
	levelManager.connect_stage_signal()
	#await get_tree().process_frame
	print("emitting signal to build level events...")
	emit_signal("eventLevelsSetSuccess")

#func create_event_levels_dictionary():
#	for lvl in event.level:
#		eventLevels[lvl] = null
