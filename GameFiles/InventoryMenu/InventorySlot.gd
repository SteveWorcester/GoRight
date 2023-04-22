extends Panel

var default_texture = preload("res://GameFiles/InventoryMenu/InventorySlot_Usable.png")
var empty_texture = preload("res://GameFiles/InventoryMenu/Inventory_Background.png")

var default_style : StyleBoxTexture = null
var empty_style : StyleBoxTexture = null

var itemClass = preload("res://GameFiles/Items/Item.tscn")
var item = null

func _ready() -> void:
	default_style = StyleBoxTexture.new()
	empty_style = StyleBoxTexture.new()
	default_style.texture = default_texture
	empty_style.texture = empty_texture
	
	if randi() %3 == 0:
		item = itemClass.instantiate()
		add_child(item)
	
	refresh_style()

func refresh_style():
	if item == null:
		set('custom_styles/panel', empty_style)
	else:
		set('custom_styles/panel', default_style)

func pickupFromSlot():
	remove_child(item)
	var inventoryNode = find_parent("Inventory")
	inventoryNode.add_child(item)
	item = null
	refresh_style()
	
func placeIntoSlot(new_item):
	item = new_item
	item.position = Vector2(0,0)
	var inventoryNode = find_parent("Inventory")
	inventoryNode.remove_child(item)
	add_child(item)
	refresh_style()
