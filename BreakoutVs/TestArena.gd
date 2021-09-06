extends Node2D

func _ready():
	pass 

var player1Score = 0
var player2Score = 0 
var player1Lives = 3
var player2Lives = 3

func playerScore():
	player1Score += 1
	$player1ScoreCounter.text = str(player1Score)
	player2Score += 1 
	$player2ScoreCounter.text = str(player2Score)
	
func playerLives():
	player1Lives -= 1
	$player1LivesCounter.text = str(player1Lives)
	player2Lives -= 1 
	$player2ivesCounter.text = str(player2Lives)
#	if lives == 0 
#	display "game over"

	
