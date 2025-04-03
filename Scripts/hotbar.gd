
extends GridContainer

@export var slot_scene:PackedScene
var blankItem:Item = preload("res://DATA/Items/blank.tres")

func showHotbar(items:Array[Item]):
	
	for child in get_children():
		child.queue_free()
	
	var num_slots = 10
	var items_to_display = items.slice(0, num_slots)  
	var blanks_needed = num_slots - items_to_display.size()

	for item in items_to_display:
		var slot = slot_scene.instantiate()
		add_child(slot)
		slot.display(item)
	
	for i in range(blanks_needed):
		var slot = slot_scene.instantiate()
		add_child(slot)
		slot.display(blankItem)
