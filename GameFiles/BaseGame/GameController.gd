extends Node

@onready var party = $Party

var turnCounter
var allCombatants
var currentCombatant

@onready var travelOrigin : Vector2 = party.partyLeader.position
var distanceFromOrigin = 0
@onready var positionLastUpdate : Vector2 = party.partyLeader.position
var movementTracker = 0

var stageLength = 1000
var randomEventCheckinDistance = 1000
var eventChance = 1000
var enemyChance = 1000
var treasureChance = 1000
var treasureAvailable = true

func _process(delta: float) -> void:
	distanceFromOrigin = party.partyLeader.position.x - travelOrigin.x
	movementTracker += abs(party.partyLeader.position.x - positionLastUpdate.x)
	if int(movementTracker) % randomEventCheckinDistance == 0:
		#combat chance; event chance
		pass
	if  int(distanceFromOrigin) % eventChance == 0 and treasureAvailable:
		#treasure
		pass
	if distanceFromOrigin >= stageLength:
		#end level
		pass
	
	positionLastUpdate = party.partyLeader.position
	
	pass

func set_event_levels(eventLevels):
	if eventLevels["distance_per_chance_roll"] == 1000 or eventLevels["event_chance"] == 1000 or eventLevels["enemy_chance"] == 1000 or eventLevels["treasure_chance"] == 1000:
		print("One or more of the event levels (treasure/enemy chance) have not been set")
	randomEventCheckinDistance = eventLevels["distance_per_chance_roll"]
	eventChance = eventLevels["event_chance"]
	enemyChance = eventLevels["enemy_chance"]
	treasureChance = eventLevels["treasure_chance"]
	stageLength = eventLevels["stage_length"]
	pass

func begin_combat():
	pass

func setup_turn_queue():
	pass

func next_turn():
	pass

