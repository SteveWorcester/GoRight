class_name State_Base
extends Node

enum Player_State {
	Null,
	Idle,
	Moving,
	Interacting,
	Combat,
	InTown
}

var character : CharacterBody2D

func enter() -> void:
	#player.animations.play(animation_name)
	pass

func exit() -> void:
	pass
	
func input(event: InputEvent) -> int:
	return Player_State.Null
	
func process(delta: float) -> int:
	return Player_State.Null
	
func physics_process(delta: float) -> int: 
	return Player_State.Null
