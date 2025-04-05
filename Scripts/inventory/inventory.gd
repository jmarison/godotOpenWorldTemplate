class_name Inventory

var _content:Array[Item] = []


func add_item(item:Item):
	for existing_stack in _content:
		if existing_stack.name == item.name and existing_stack.count < existing_stack.maxStack:
			existing_stack.count += 1
			return
	var new_item = item.duplicate()
	new_item.count = 1
	_content.append(new_item)
	
	

func remove_item(item:Item):
	_content.erase(item)

func get_items() -> Array[Item]:
	return _content

func has_all(items:Array[Item]) -> bool:
	var needed:Array[Item] = items.duplicate()
	for available in _content:
		needed.erase(available)
	return needed.is_empty()
