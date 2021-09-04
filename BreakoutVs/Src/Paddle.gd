extends KinematicBody2D

var moveSpeed = 250 
var velocity = Vector2(0,0)
var maxSpeed = 500
var applyFriction = false
enum direction { none,left,right }
var currentDirection = direction.none

func _ready():
   set_process_input(true)

func _input(event):
	
	if event.is_action_pressed("p1_paddle_left") and currentDirection != direction.left:
		currentDirection = direction.left 
		print("left")
	elif event.is_action_pressed("p1_paddle_right") and currentDirection != direction.right:
		currentDirection = direction.right
		print("right")
	else:
		currentDirection = direction.none
		print("no direction")
		


func _physics_process(delta):
	if currentDirection == direction.left:
		velocity.x -= moveSpeed
		
	elif currentDirection == direction.right:
		velocity.x += moveSpeed
	else:
		velocity.x -= velocity.x*0.1
	
	velocity  = velocity.clamped(maxSpeed)	
	move_and_collide(velocity*delta)
	
	
