extends Node
@onready var crosshair: TextureRect = %TextureRect


func _ready() -> void:
	randomize()
	crosshair.position.x = get_viewport().size.x / 2 - 32
	crosshair.position.y = get_viewport().size.y / 2 - 32
