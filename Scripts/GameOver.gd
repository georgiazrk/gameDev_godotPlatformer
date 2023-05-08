extends Control


func _ready():
	MusicController.play_gameover_music()


func _on_GOTryAgainBtn_pressed():
	if Global.current_level == "World":
		Global.lives = Global.max_lives
		get_tree().change_scene("res://Scenes/Level1.tscn")
	
	if Global.current_level == "World2":
		Global.lives == Global.max_lives
		get_tree().change_scene("res://Scenes/Level2.tscn")

func _on_GOMenuBtn_pressed():
	get_tree().change_scene("res://Scenes/TitleMenu.tscn")


func _on_GOExitBtn_pressed():
	get_tree().quit()
