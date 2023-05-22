extends Level_Base

func _ready() -> void:
	await super._ready()
	eventLevels[event.level.distance_per_chance_roll] = 10
	eventLevels[event.level.event_chance] = 10
	eventLevels[event.level.enemy_chance] = 50
	eventLevels[event.level.treasure_chance] = 30
	eventLevels[event.level.stage_length] = 100
	eventLevels[event.level.none] = 10
	print("event levels set for S1_L1...")
	setLevelsComplete()
