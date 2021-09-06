extends KinematicBody2D

class_name Ball

enum BallOwner { Neutral, Red, Blue }
var lastTouch = BallOwner.Neutral 

onready var sprite = get_node("./Sprite")

var velocity = Vector2(200,200)
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("balls")
	
func _physics_process(delta):
	
	# Move and check if we hit something
	
	var collisionInfo = move_and_collide(velocity*delta)
	if collisionInfo:
		velocity = velocity.bounce(collisionInfo.normal)
		
		print(collisionInfo.collider.name)
		
		if(collisionInfo.collider.is_in_group("paddles")):
			if(collisionInfo.collider.paddle == Paddle.PaddleType.P1):
				lastTouch = BallOwner.Blue
			else:
				lastTouch = BallOwner.Red
			updateBallSprite(lastTouch)
				
		if(collisionInfo.collider.is_in_group("bricks")):
			if(lastTouch != BallOwner.Neutral):
				collisionInfo.collider.destroy_brick(lastTouch)
				
	
func updateBallSprite(newOwner):
	# Update Sprite based on the last touch 
	var name = "res://Assets/" + BallOwner.keys()[newOwner]
	sprite.texture = load(name + "Ball.png")

	
