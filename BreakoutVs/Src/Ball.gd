extends KinematicBody2D

class_name Ball

enum BallOwner { Neutral, Red, Blue }

var lastTouch = BallOwner.Neutral 
export var ballSpeedup = .001
var bricksBroke = 0

onready var sprite = get_node("./Sprite")

var velocity = Vector2(200,200)
export var maxSpeed = 500
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
				print(velocity.length())
				if(velocity.length() < maxSpeed):
					bricksBroke += 1
					velocity += velocity * (bricksBroke * ballSpeedup)
					
		
		if(collisionInfo.collider.name == "bottomWall"):
			GameSignals.emit_signal("lifeLost", collisionInfo.collider.name)
		
		if(collisionInfo.collider.name == "topWall"):
			GameSignals.emit_signal("lifeLost", collisionInfo.collider.name)
				
	
func updateBallSprite(newOwner):
	# Update Sprite based on the last touch 
	var name = "res://Assets/" + BallOwner.keys()[newOwner]
	sprite.texture = load(name + "Ball.png")
	


	
