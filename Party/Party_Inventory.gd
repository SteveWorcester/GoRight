extends Control

const SlotClass = preload("res://GameFiles/HUD/Inventory/InventorySlot.gd")
@onready var inventory_slots = $GridContainer
var holding_item = null

func _ready() -> void:
	for slot in inventory_slots.get_children():
		slot.gui_input.connect(_on_slot_gui_input.bind(slot))

func _on_slot_gui_input(event : InputEvent, slot : SlotClass):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT && event.pressed:
			if holding_item != null:
				if !slot.item:
					slot.placeIntoSlot(holding_item)
					holding_item = null
				else:
					var temp_item = slot.item
					slot.pickupFromSlot()
					temp_item.global_position = event.global_position
					slot.placeIntoSlot(holding_item)
					holding_item = temp_item
			elif slot.item:
				holding_item = slot.item
				slot.pickupFromSlot()
				holding_item.global_position = get_global_mouse_position()
				
func _input(event):
	if holding_item:
		holding_item.global_position = get_global_mouse_position()
