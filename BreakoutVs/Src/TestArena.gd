extends Node2D


var player1Score = 0
var player2Score = 0 
var player1Lives = 3
var player2Lives = 3

onready var p1ScoreUI = get_node("UI/player1ScoreCounter")
onready var p2ScoreUI = get_node("UI/player2ScoreCounter")
onready var p1LivesUI = get_node("UI/player1LivesCounter")
onready var p2LivesUI = get_node("UI/player2LivesCounter")
onready var playerWinnerUI = get_node("GameOverScreen/PanelContainer/MarginContainer/Rows/Title/winnerLabel")

func _ready():
	GameSignals.connect("BrickDestroyed", self, "_playerScore")
	GameSignals.connect("lifeLost", self, "_playerLives")
	$GameOverScreen.get_child(0).hide()
	GameState.RegisterBallSpawns(get_node("./BallSpawns"))
	
func _process(delta):
	pass

func _playerScore(lastTouch, value):
	print("calc Score")
	if lastTouch == Ball.BallOwner.Blue:
		player1Score += value
		p1ScoreUI.text = "Score: " + str(player1Score)
	elif lastTouch == Ball.BallOwner.Red:
		player2Score += value
		p2ScoreUI.text = "Score: " + str(player2Score)
	
func _playerLives(wallName):
	if wallName == "topWall":
		player1Lives -= 1
		p1LivesUI.text = "Lives: " + str(player1Lives)
	elif wallName == "bottomWall":
		player2Lives -= 1 
		p2LivesUI.text = "Lives: " + str(player2Lives)
	if player1Lives == 0 || player2Lives == 0:
		$GameOverScreen.get_child(0).show()
		if player1Lives == 0:
			playerWinnerUI.text = "Player 2 Wins"
		elif player2Lives == 0:
			playerWinnerUI.text = "Player 1 Wins"
