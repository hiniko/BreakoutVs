tool

extends KinematicBody2D

enum BrickTypes {
	Neutral,
	Red,
	Blue,
	Special,
	Unbreakable,
}

export(BrickTypes) var type = BrickTypes.Neutral setget UpdateSprite

func UpdateSprite(value):
	
	 if is_inside_tree():
		 var sprite = get_node("./Sprite")
		 var name = "res://Assets/" + BrickTypes.keys()[value]
		 sprite.texture = load(name + "Brick.png"  )
		 type = value
		
	
# Update the brick when updated in editor
func property_list_changed_notify():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	UpdateSprite(type)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
