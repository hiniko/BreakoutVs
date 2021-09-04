extends KinematicBody2D

var moveSpeed = 250 
var velocity = Vector2(0,0)
var maxSpeed = 500
var friction = 0.1
var applyFriction = false
enum direction { none,left,right }
var currentDirection = direction.none

func _ready():
	pass

#func _input(event):
#
#	var newDir = null
#
#	if event.is_action_pressed("p1_paddle_left"):
#		newDir = direction.left 
#	elif event.is_action_pressed("p1_paddle_right"):
#		newDir = direction.right
#	else:
#		newDir = direction.none
#		print("no direction")
#
#	if (event is InputEventKey && event.is_echo() || newDir != currentDirection):
#		currentDirection = newDir
#		print(event.as_text())
		


func _physics_process(delta):
	
	var dir = direction.none
	
	if(Input.is_action_pressed("p1_paddle_left") && currentDirection != direction.left):
		print("Left")
		dir = direction.left
	elif(Input.is_action_pressed("p1_paddle_right") && currentDirection != direction.right):
		print("Right")
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
	
	print(velocity)
	
	
