class_name PC_BaseStates
extends Node

enum PC_State {
	Null,
	Idle,
	Moving,
	Interacting,
	Combat,
	InTown
}

var party : Array

func enter() -> void:
	#player.animations.play(animation_name)
	pass

func exit() -> void:
	pass
	
func input(event: InputEvent) -> int:
	return PC_State.Null
	
func process(delta: float) -> int:
	return PC_State.Null
	
func physics_process(delta: float) -> int: 
	return PC_State.Null
