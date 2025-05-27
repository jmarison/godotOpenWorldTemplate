class_name ItemGrid
extends GridContainer

@export var slot_scene:PackedScene
var blankItem:Item = preload("res://DATA/Items/blank.tres")
var shownItems: Array[Item] = []

func craftingdisplay(items:Array[Item]):
	for child in get_children():
		child.queue_free()
	
	shownItems.clear()
	
	for item in items:
		var  found = false
		for existingStack in shownItems:
			if existingStack.name == item.name:
				existingStack.count += 1
				found = true
				break
		if not found:
			var newItem = item.duplicate()
			newItem.count = 1
			shownItems.append(newItem)
	
	for item in shownItems:
		var slot = slot_scene.instantiate()
		add_child(slot)
		slot.display(item)

func display(items:Array[Item]):
	var num_slots = 60
	var items_to_display = items.slice(0, num_slots)  
	var blanks_needed = num_slots - items_to_display.size()
	
	for child in get_children():
		child.queue_free()
	
	for item in items_to_display:
		var slot = slot_scene.instantiate()
		add_child(slot)
		slot.display(item)
	
	for i in range(blanks_needed):
		var slot = slot_scene.instantiate()
		add_child(slot)
		slot.display(blankItem)
