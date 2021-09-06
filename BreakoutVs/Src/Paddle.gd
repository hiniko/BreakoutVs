tool

extends KinematicBody2D

class_name Paddle

enum direction { none,left,right }
enum PaddleType { P1, P2 }

export(PaddleType) var paddle setget SetPaddle

var InputHeader = ""
var moveSpeed = 250 
var velocity = Vector2(0,0)
var maxSpeed = 500
var friction = 0.1
var currentDirection = direction.none

func SetPaddle(value):
	paddle = value
	InputHeader = PaddleType.keys()[value].to_lower()
	if is_inside_tree():
		var sprite = get_node("./Sprite")
		var name = "res://Assets/" + PaddleType.keys()[value]
		sprite.texture = load(name + "Paddle.png")
	

func _ready():
	SetPaddle(paddle)
	add_to_group("paddles")

func _physics_process(delta):
	if(Engine.editor_hint): 
		return;
		
	# This is better not in input as we don't have keyrepeat issues
	# we are seeing in MacOS. You shoudln't have to turn off your
	# key repeat to do this... 
	# Would also work a lot better if we could work out properly 
	# What to do when two keys are pressed. This is just a compromise	 
	var dir = direction.none
	if(Input.is_action_pressed(InputHeader + "_paddle_left") && currentDirection != direction.left):
		dir = direction.left
	elif(Input.is_action_pressed(InputHeader + "_paddle_right") && currentDirection != direction.right):
		dir = direction.right
		
	currentDirection = dir 

	if dir == direction.left:
		velocity.x -= moveSpeed 
		
	elif dir == direction.right:
		velocity.x += moveSpeed 
	else:
		velocity.x -= velocity.x*friction
		
	move_and_collide(velocity*delta)
	velocity = velocity.clamped(maxSpeed)
	
	
	
