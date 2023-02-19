extends KinematicBody2D


# Declare member variables here. Examples:
export var horizontal_speed = 200
export var gravity = 98
export var stamina = 10
var velocity = Vector2.ZERO

var running

onready var lstamina = get_node("Label_Stamina")
onready var	lmode = get_node("Label_Mode")
onready var lvelocity = get_node("Label_Velocity")

signal hit_floor
signal hit_object

# Called when the node enters the scene tree for the first time.
func _ready():
	running = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if running == 0:
		if Input.is_action_just_pressed("go_up"):
			velocity = Vector2(horizontal_speed, -horizontal_speed)

			running = 1
	elif running == 1:
		if Input.is_action_pressed("go_up") and stamina > 0:
			velocity.y -= delta * gravity * 2
			stamina -= delta
			lmode.text = "Mod: UP"
		else:
			velocity.y = clamp(velocity.y + delta * gravity, -INF, horizontal_speed*1.25)
			lmode.text = "Mod: DOWN"

		lstamina.text = "Sta: " + str(stamina)
		lvelocity.text = "Vel: " + str(velocity)

		move_and_slide(velocity)
		
	if is_on_floor():
		running = 2
		emit_signal("hit_floor")
		

func start(pos):
	position = pos
	$Sprite.visible = true
