extends Node3D

@export var inHandItem: Item

func _ready():
	if inHandItem and inHandItem.scene:
		var instance = inHandItem.scene.instantiate()
		add_child(instance)
	else:
		print("inHandItem or inHandItem.scene is not set")

func setItem(item: Item):
	inHandItem = item
	_update_displayed_item()

func _update_displayed_item():
	# Remove the old item
	for child in get_children():
		remove_child(child)
		child.queue_free()
	
	# Add the new item
	if inHandItem and inHandItem.scene:
		var instance = inHandItem.scene.instantiate()
		add_child(instance)
	else:
		print("inHandItem or inHandItem.scene is not set")
