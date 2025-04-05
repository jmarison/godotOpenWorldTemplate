extends PanelContainer

@onready var texture_rect: TextureRect = %TextureRect
@onready var label: Label = $Label

func display(item:Item):
	texture_rect.texture = item.icon
	if item.count < 2:
		label.hide()
	label.text = str(item.count)
	
func craftingDisplay(item:Item):
	texture_rect.texture = item.icon
	
