extends Node2D

export (PackedScene) var ground_scene
onready var groundStartPosition = get_node("GroundStartPosition")
onready var camera = get_node("Player/Camera2D")

var score
var grounds: Array

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func set_ground_to_start():
	grounds = []
	for i in range(2):
		var gs = ground_scene.instance()
		gs.position = groundStartPosition + Vector2(i * gs.width,0)
		add_child(gs)
		grounds.append(gs)

func game_over():
	
	pass


func new_game():
	set_ground_to_start()
	$Player.start($PlayerStartPosition.position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for gs in grounds:
		print(gs.texture.get_rect())
