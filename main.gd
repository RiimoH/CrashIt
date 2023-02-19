extends Node2D

export (PackedScene) var ground_scene

var score

var floor_x = 0
var floor_x_advance = 667

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func game_over():
	pass


func new_game():
	var gs
	for x in range(5):
		gs = ground_scene.instance()
		gs.position = Vector2(floor_x,500)
		floor_x += floor_x_advance
	$Player.start($PlayerStartPosition.position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
