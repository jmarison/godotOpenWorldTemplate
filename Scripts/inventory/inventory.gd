class_name Inventory

var _content:Array[Item] = []

signal inventory_updated

func add_item(item:Item):
	_content.append(item)
	inventory_updated.emit()

func remove_item(item:Item):
	_content.erase(item)
	inventory_updated.emit()

func get_items() -> Array[Item]:
	return _content

func has_all(items:Array[Item]) -> bool:
	var needed:Array[Item] = items.duplicate()
	for available in _content:
		needed.erase(available)
	return needed.is_empty()
