extends Player_Controller

func _ready() -> void:
	await super._ready()
	className = "Axe Master"

func save():
	get_character_save_data(self)
