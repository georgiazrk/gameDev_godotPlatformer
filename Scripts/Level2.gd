extends Node


func _ready():
	MusicController.play_music()
	#reset hearts and hearts in hud
	Global.lives = 3
	$HUD.load_hearts()
