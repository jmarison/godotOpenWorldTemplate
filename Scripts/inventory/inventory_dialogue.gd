class_name InventoryDialog
extends PanelContainer
@export var slot_scene:PackedScene
@onready var crosshair: Control = %Crosshair

@onready var grid_container: ItemGrid = %GridContainer


func open(inventory:Inventory):
	show()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	#amountOfItems = inventory.size()
	#blankItems = maxItems - amountOfItems
	
	grid_container.display(inventory.get_items())
	
	
	

func _on_close_button_pressed() -> void:
	hide()
	crosshair.show()
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
