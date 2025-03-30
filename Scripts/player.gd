extends CharacterBody3D

var SPEED = 5.0
const JUMP_VELOCITY = 8.5
const BOB_FREQ = 1.4
const BOB_AMP = 0.04
var t_bob = 0.0
var camera_sens = 30
var capMouse = false
var gravity = 18.0
var rng = RandomNumberGenerator.new()
var inventory:Inventory = Inventory.new()



var look_dir: Vector2
@onready var head = $Head
@onready var camera = $Head/Camera3D
#guns
@onready var shotgun = $Head/Camera3D/Shotgun
@onready var shotgunShootAnimation = $Head/Camera3D/Shotgun/AnimationPlayer
@onready var barrel = $Head/Camera3D/Shotgun/Barrel

@onready var LOS = $Head/Camera3D/AimRay
@onready var endLOS = $Head/Camera3D/AimRayEnd

var bullet_trail = load("res://Objects/bullet_trail.tscn")



	
func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_pressed("sprint"):
		SPEED = 8
	else:
		SPEED = 5

	var input_dir = Input.get_vector("left", "right", "forward", "backwards")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if is_on_floor():
		if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
		else:
			velocity.x = lerp(velocity.x, direction.x * SPEED, delta * 7.0)
			velocity.z = lerp(velocity.z, direction.z * SPEED, delta * 7.0)
	else:
		velocity.x = lerp(velocity.x, direction.x * SPEED, delta * 4.0)
		velocity.z = lerp(velocity.z, direction.z * SPEED, delta * 4.0)
		
	if Input.is_action_just_pressed("pause"):
		capMouse = !capMouse
		
		if capMouse:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.is_action_just_pressed("lmb"):
		_shoot()
		
		
	#head bob
	t_bob += delta * velocity.length() * float(is_on_floor())
	shotgun.transform.origin = _headbob(t_bob) + Vector3(0.202, -0.225, -.454)
	
	 
	
	#_shoot_auto()
	_rotate_camera(delta)
	move_and_slide()
	

func _input(event: InputEvent):
	if event is InputEventMouseMotion: look_dir = event.relative * 0.01
	
func _rotate_camera(delta: float, sens_mod: float = 1.0):
	var input = Input.get_vector("ui_left", "ui_right","ui_down", "ui_up")
	look_dir += input
	rotation.y -= look_dir.x * camera_sens * delta
	camera.rotation.x = clamp(camera.rotation.x - look_dir.y * camera_sens * sens_mod * delta, -1.5, 1.5)
	look_dir = Vector2.ZERO
	shotgun.rotation.y = 3.14159 

func _headbob(time) -> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(time * BOB_FREQ) * BOB_AMP
	return pos

	
func _shoot():
	#if !shotgunShootAnimation.is_playing():
		#shotgunShootAnimation.play("shotgunShoot")
		#for i in range(7):
			#var instance = bullet_trail.instantiate()
			#var spread = Vector3(rng.randf_range(-1.0, 1.0), rng.randf_range(-1.0, 1.0), rng.randf_range(-1.0, 1.0))
		#
			#if LOS.is_colliding():
				#instance.init(barrel.global_position, LOS.get_collision_point() + spread * .4)
				## if LOS.get_collider().is_in_group("enemy"):
				##     LOS.get_collider().hit()
			#else:
				#instance.init(barrel.global_position, endLOS.global_position + spread * 2.5)
			#get_parent().add_child(instance)
			pass
			
# ------ ITEMS STUFF -------

func on_item_picked_up(item:Item):
	inventory.add_item(item)
