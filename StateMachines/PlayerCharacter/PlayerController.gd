class_name Player_Controller
extends CharacterBody2D

@onready var state_manager = $StateManager

@export var characterName : String
@export var className : String

var equipment_head
var equipment_armor
var equipment_accessory
var equipment_weapon

@export var health : int
@export var mana : int

@export var attackPower : float
@export var magicPower : float
@export var speed : float
@export var critChance : float
@export var damageReduction : float

func _ready():
	state_manager.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_manager.input(event)

func _physics_process(delta: float) -> void:
	state_manager.physics_process(delta)

func get_character_save_data(playerSelf) -> Dictionary:
	var save_dict = {
		"file_name": playerSelf.get_scene_file_path(),
		"parent": playerSelf.get_parent().get_path(),
		
		"character_name": playerSelf.characterName,
		"class_name": playerSelf.className,
		
		"equipment_head": playerSelf.equipment_head,
		"equipment_armor": playerSelf.equipment_armor,
		"equipment_accessory": playerSelf.equipment_accessory,
		"equipment_weapon": playerSelf.equipment_weapon,
		
		"health": playerSelf.health,
		"mana": playerSelf.mana,
		
		"attack_power": playerSelf.attackPower,
		"magic_power": playerSelf.magicPower,
		"speed": playerSelf.speed,
		"crit_chance": playerSelf.critChance,
		"damage_reduction": playerSelf.damageReduction
	}
	return save_dict
