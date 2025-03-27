extends CanvasLayer

@onready var player: CharacterBody3D = %Player
@onready var inventory_dialogue: InventoryDialog = %InventoryDialogue
@onready var crosshair: Control = %Crosshair

func _unhandled_input(event):
	if (event.is_action_released("inventory")):
		inventory_dialogue.open(player.inventory)
		crosshair.hide()
