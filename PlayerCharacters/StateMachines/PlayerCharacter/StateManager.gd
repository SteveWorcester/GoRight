extends Node

@onready var states = {
	State_Base.Player_State.Idle: $Idle,
	State_Base.Player_State.Moving: $Moving
}

var current_state : State_Base

func init(player) -> void:
	for child in get_children():
		child.character = player
	change_state(State_Base.Player_State.Idle)

func change_state(newState : int) -> void:
	if current_state:
		current_state.exit()
		
	current_state = states[newState]
	current_state.enter()

func input(event: InputEvent) -> void:
	var new_state = current_state.input(event)
	if new_state != State_Base.Player_State.Null:
		change_state(new_state)
		
func physics_process(delta: float):
	var new_state = current_state.physics_process(delta)
	if new_state != State_Base.Player_State.Null:
		change_state(new_state)
