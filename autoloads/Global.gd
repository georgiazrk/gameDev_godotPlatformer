extends Node

var coins = 0
var max_lives = 3
var lives = max_lives
var hud
var current_level

func lose_life():
	lives -= 1
	print(lives)
	hud.load_hearts()
	if lives <= 0:
		get_tree().change_scene("res://Scenes/GameOver.tscn")
	
