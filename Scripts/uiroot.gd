extends CanvasLayer

@onready var player: CharacterBody3D = %Player
@onready var inventory_dialogue: InventoryDialog = %InventoryDialogue
@onready var crosshair: Control = %Crosshair
@onready var crafting_dialogue: CraftingDialog = %CraftingDialogue 


var _all_recipes:Array[Recipe] = []

func _ready():
	for file in DirAccess.get_files_at("res://DATA/Recipes"):
		var resource_file = "res://DATA/Recipes/" + file
		var recipe:Recipe = load(resource_file)
		_all_recipes.append(recipe)
		
func _unhandled_input(event):
	if (event.is_action_released("inventory")):
		inventory_dialogue.open(player.inventory)
		crosshair.hide()
	if (event.is_action_released("crafting")):
		crafting_dialogue.open(_all_recipes, player.inventory)
		crosshair.hide()
