extends Node

var ballInPlay = false
var ballSpawns = null
var curBallSpawnIdx = 0
var ballScene = preload("res://Actors/Ball.tscn") 
var ballNode = null

func _ready():
	GameSignals.connect("GameStart", self, "GameStart")
	

	
		
func RegisterBallSpawns(spawns:Node):
	print(spawns)
	if(spawns == null):
		printerr("Can't register Spawns Node is null")
	if(spawns.get_children() != null && spawns.get_children().size() == 0):
		printerr("Spawns array contain no nodes!")
	ballSpawns = spawns.get_children()

func _input(event):
	var startRound = event.is_action_released("start_round")
	if(!ballInPlay && startRound):
		GameSignals.emit_signal("GameStart")

func GameStart():
	if(!ballInPlay && ballSpawns.size() > 0):
		var ball = ballScene.instance()
		ball.position.x = ballSpawns[curBallSpawnIdx].position.x
		ball.position.y = ballSpawns[curBallSpawnIdx].position.y
		curBallSpawnIdx = (curBallSpawnIdx + 1) % ballSpawns.size()
