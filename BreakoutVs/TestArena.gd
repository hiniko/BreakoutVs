extends Node2D

func _ready():
	pass 

var player1Score = 0
var player2Score = 0 

func coin_counter():
	player1Score += 1
	$Player1_counter.text = str(player1Score)
	player2Score += 1 
	$Player2_counter.text = str(player2Score)
