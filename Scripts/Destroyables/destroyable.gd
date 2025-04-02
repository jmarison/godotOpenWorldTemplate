extends Node3D
class_name destroyable
@export var obj:worldObject


func _ready():
	var instance = obj.scene.instantiate()
	add_child(instance)


func _process(delta: float) -> void:
	if (obj.hp <= 0):
		queue_free()
		dropItems()


	#obj.hp -= damage
	#print(obj.name + " " + obj.hp)

func dropItems():
	for item in obj.droppedItems:
		var instance = item.scene.instantiate()
		add_child(instance)


func _on_static_body_3d_take_damage() -> void:
	print("signal made it :>")
