tool

extends RigidBody2D

signal brick_destroyed(by_paddle, value)

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

# Called when the node enters the scene tree for the first time.
func _ready():
	UpdateSprite(type)
	add_to_group("bricks")

func _physics_process(_delta):
	if(Engine.editor_hint):
		return

func destroy_brick(paddle):
	print("IM HIT %s" % name)
	emit_signal("brick_destroyed", paddle, 1)
	queue_free()
