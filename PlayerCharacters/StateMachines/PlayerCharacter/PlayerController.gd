class_name Player_Controller
extends CharacterBody2D

@onready var state_manager = $StateManager

func _ready():
	state_manager.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_manager.input(event)

func _physics_process(delta: float) -> void:
	state_manager.physics_process(delta)
