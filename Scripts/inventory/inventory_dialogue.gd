class_name InventoryDialog
extends PanelContainer

@export var slot_scene:PackedScene
@onready var crosshair: Control = %Crosshair

@onready var grid_container: GridContainer = %GridContainer

func open(inventory:Inventory):
	show()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	for child in grid_container.get_children():
		child.queue_free()
	
	for item in inventory.get_items():
		var slot = slot_scene.instantiate()
		grid_container.add_child(slot)
		slot.display(item)

func _on_close_button_pressed() -> void:
	hide()
	crosshair.show()
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
