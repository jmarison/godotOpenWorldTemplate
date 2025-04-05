class_name Item
extends Resource

@export var name: String = "unknown item"
@export var scene: PackedScene = preload("res://Models/noModel.glb")
@export var icon: Texture2D = preload("res://Items/itemIcons/blankIcon.png")
@export var maxStack = 50
@export var count = 1
