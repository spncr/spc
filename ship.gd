extends RigidBody2D

export (int) var engine_thrust
export (int) var spin_thrust

const RATE = 1 # per second

var thrust = 0
const MAX_THRUST = 10
var counter = 0

var rotation_dir = 0

func _ready():
	pass # Replace with function body.

func get_input():
	if Input.is_action_pressed("thrust"):
		thrust = move_toward(thrust, MAX_THRUST, 10)
	else:
		thrust = move_toward(thrust, 0, 20)
		
	rotation_dir = 0
	
	if Input.is_action_pressed("ui_right"):
		rotation_dir += 1
	if Input.is_action_pressed("ui_left"):
		rotation_dir -= 1

func _process(delta):
	var velocity = linear_velocity.length()
	
	$"Thrust Sprite".scale = Vector2(thrust/3000, thrust/1000)
	
	get_input()
	$_DEBUGthrst.text = str(thrust)
	
	counter += delta
	if counter > 1 / RATE:
		$ThrustParticles.emitting = true

func _physics_process(_delta):
	var thrust_rotated = Vector2(0, -thrust).rotated(rotation)
	apply_central_impulse(thrust_rotated)
	#set_applied_force(thrust_rotated)
	set_applied_torque(rotation_dir * spin_thrust)
