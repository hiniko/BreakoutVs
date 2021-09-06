tool

extends RigidBody2D

enum BrickTypes {
	Neutral,
	Red,
	Blue,
	Special,
	Unbreakable,
}

export(BrickTypes) var type setget UpdateSprite

func UpdateSprite(value):
	type = value
	if is_inside_tree():
		var sprite = get_node("./Sprite")
		var name = "res://Assets/" + BrickTypes.keys()[value]
		sprite.texture = load(name + "Brick.png")

# Update the brick when updated in editor
#func property_list_changed_notify():
#	UpdateSprite(type)
#	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	UpdateSprite(type)
	add_to_group("bricks")

func _physics_process(_delta):
	if(Engine.editor_hint):
		return
	
	var collisions = get_colliding_bodies()
	for body in collisions:
		if(body.in_group == "balls"):
			print("A ball hit me! I guess I'm done...")
			queue_free()

func _on_body_entered(_body):
	print("Got hit, Time to go...") 
	queue_free()
