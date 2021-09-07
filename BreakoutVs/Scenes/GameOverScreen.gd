extends CanvasLayer


func _on_quitButton_pressed():
	get_tree().quit()


func _on_restartButton_pressed():
	get_tree().change_scene("res://Scenes/TestArena.tscn")
