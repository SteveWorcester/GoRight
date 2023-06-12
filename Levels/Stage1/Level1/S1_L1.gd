extends Level_Base

func _ready() -> void:
	await super._ready()
	
	eventLevels[event.level.event_chance] = 1
	eventLevels[event.level.enemy_chance] = 1
	eventLevels[event.level.treasure_chance] = 1
	eventLevels[event.level.none] = 1
	eventLevels[event.level.distance_per_chance_roll] = 1
	eventLevels[event.level.stage_length] = 100
	print("event levels set for S1_L1...")
	setLevelsComplete()
