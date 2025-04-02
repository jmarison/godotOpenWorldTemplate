class_name worldObject
extends Resource


@export var name: String = "unknown"
@export var scene: PackedScene = preload("res://Models/noModel.glb")
@export var hp = 100
	#this is tier of strength required to harvest the material 
	#EX in minecraft you need iron tier to mine diamond and terraria you need pallidium/cobalt to mine mythril/orichalcum
	#-1 = unbreakable, 0 bare hand, 1 wood, 2 iron...
@export var tier = 0
@export var droppedItems:Array[Item] = []
#0 = hand, 1 pickaxe, 2 shovel, 3 axe and so on
#export var tooltype = 0

 
