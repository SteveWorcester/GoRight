extends Node

@onready var state_manager = $PC_StateManager
var party_members : Array

func _ready():
	party_members.clear()
	for partyMember in get_children():
		if partyMember is CharacterBody2D:
			party_members.append(partyMember)
	state_manager.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_manager.input(event)

func _physics_process(delta: float) -> void:
	state_manager.physics_process(delta)

func _process(delta: float) -> void:
	state_manager.process(delta)
