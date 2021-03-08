extends RigidBody2D

func exist(size, origin):
	$Sprite.scale = Vector2(size, size)
	
	var solid_shape = CircleShape2D.new()
	solid_shape.radius = size * 32
	$Collision.shape = solid_shape
	
	var gravity_field_shape = CircleShape2D.new()
	gravity_field_shape.radius = size * 256
	$Gravity/Field.shape = gravity_field_shape
	
	$Gravity.gravity = 90 * size + 10
	mass = size^3 * 20
	
	position = origin
	

func _process(_delta):
	$_DEBUG.text = str($Gravity.gravity)



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
