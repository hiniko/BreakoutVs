tool 

extends KinematicBody2D

var velocity = Vector2(200,200)
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("balls")
	
func _physics_process(delta):
	if(Engine.editor_hint):
		return
		
	var collision_info = move_and_collide(velocity*delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.normal)
