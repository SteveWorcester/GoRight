extends Level_Base

func _ready() -> void:
	await super._ready()
	eventLevels["distance_per_chance_roll"] = 10
	eventLevels["event_chance"] = 10
	eventLevels["enemy_chance"] = 50
	eventLevels["treasure_chance"] = 30
	eventLevels["stage_length"] = 100
	setLevelsComplete()
