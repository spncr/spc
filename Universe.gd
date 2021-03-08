extends Node2D

var Planet = preload("res://planet.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	create_planet(6, Vector2(-1600, -2200))
	create_planet(4, Vector2	(0, -1600))
	create_planet(2, Vector2(800, 0))
	create_planet(3, Vector2(-1200, 0))

	create_planet(10, Vector2(2400, 2400))

func create_planet(size:int, location):
	var planet = Planet.instance()
	add_child(planet)
	planet.exist(size, location)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	if Input.is_action_pressed("zoom_in"):
		print("zin")
		$Ship/Camera2D.zoom += Vector2(1,1) * delta
	elif Input.is_action_pressed("zoom_out"):
		$Ship/Camera2D.zoom -= Vector2(1,1) * delta
	elif Input.is_action_pressed("zoom_reset"):
		$Ship/Camera2D.zoom = Vector2(2, 2)

	$Ship/Camera2D/_DEBUG.text = str (-$Ship.thrust)
