extends Node

var baseState = preload("res://PlayerCharacters/Party/PC_BaseStates.gd")

@onready var states = {
	baseState.PC_State.Idle: $Idle,
	baseState.PC_State.Moving: $Moving
}

var current_state : PC_BaseStates

func init(party) -> void:
	#party_members
	for child in get_children():
		child.party = party.party_members
	change_state(baseState.PC_State.Idle)

func change_state(newState : int) -> void:
	if current_state:
		current_state.exit()
		
	current_state = states[newState]
	current_state.enter()

func input(event: InputEvent) -> void:
	var new_state = current_state.input(event)
	if new_state != baseState.PC_State.Null:
		change_state(new_state)
		
func physics_process(delta: float):
	var new_state = current_state.physics_process(delta)
	if new_state != baseState.PC_State.Null:
		change_state(new_state)
		
func process(delta: float):
	current_state.process(delta)
