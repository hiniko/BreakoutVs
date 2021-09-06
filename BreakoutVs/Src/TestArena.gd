extends Node2D


var player1Score = 0
var player2Score = 0 
var player1Lives = 3
var player2Lives = 3

onready var p1ScoreUI = get_node("UI/player1ScoreCounter")
onready var p2ScoreUI = get_node("UI/player2ScoreCounter")
onready var p1LivesUI = get_node("UI/player1LivesCounter")
onready var p2LivesUI = get_node("UI/player2LivesCounter")


func _ready():
	GameSignals.connect("BrickDestroyed", self, "_playerScore")
	
func _process(delta):
	pass

func _playerScore(lastTouch, value):
	print("calc Score")
	if lastTouch == Ball.BallOwner.Red:
		player1Score += value
		p1ScoreUI.text = str(player1Score)
	elif lastTouch == Ball.BallOwner.Blue:
		player2Score += value
		p2ScoreUI.text = str(player2Score)
	
func playerLives():
	player1Lives -= 1
	p1LivesUI.text = str(player1Lives)
	player2Lives -= 1 
	p2LivesUI.text = str(player2Lives)
#	if lives == 0 
#	display "game over"

	
