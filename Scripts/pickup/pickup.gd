extends Node3D
@export var item:Item

var time : float = 0.0  
var speed = 2.0
var amplitude : float = 0.00075

func _ready():
	var instance = item.scene.instantiate()
	add_child(instance)

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.has_method("on_item_picked_up"):
		body.on_item_picked_up(item)
		queue_free()

func _process(delta: float) -> void:
	time += delta  
	position.y += sin(time * speed) * amplitude  
	rotate_y(0.008)
