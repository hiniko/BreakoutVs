extends Node2D

func _ready():
	GameSignals.connect("BrickDestroyed", self, "_playerScore")
	

var player1Score = 0
var player2Score = 0 
var player1Lives = 3
var player2Lives = 3
onready var p1score = get_node("UI/player1ScoreCounter")
onready var p2score = get_node("UI/player2ScoreCounter")



func _playerScore(lastTouch, value):
	print("calc Score")
	if lastTouch == Ball.BallOwner.Red:
		player1Score += value
		p1score.text = str(player1Score)
	elif lastTouch == Ball.BallOwner.Blue:
		player2Score += value
		p2score.text = str(player2Score)
	
func playerLives():
	player1Lives -= 1
	$p1score.text = str(player1Lives)
	player2Lives -= 1 
	$p2score.text = str(player2Lives)
#	if lives == 0 
#	display "game over"

	
