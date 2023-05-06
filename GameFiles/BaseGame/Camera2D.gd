extends Camera2D

@onready var player : CharacterBody2D = get_parent().get_child(1)

func _process(delta: float) -> void:
	if (transform != player.transform):
		transform = player.transform
