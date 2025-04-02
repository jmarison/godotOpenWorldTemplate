extends Node3D
@export var obj:worldObject


func _ready():
	var instance = obj.scene.instantiate()
	add_child(instance)


func _process(delta: float) -> void:
	if (obj.hp <= 0):
		queue_free()
