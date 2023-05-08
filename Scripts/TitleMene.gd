extends Control

func _ready():
	MusicController.play_menu_music()

func _on_OptionsButton_pressed():
	get_tree().change_scene("res://Scenes/OptionsMenu.tscn")


func _on_ExitGame_pressed():
	get_tree().quit()


func _on_HowToBtn_pressed():
	get_tree().change_scene("res://Scenes/HowToPlay.tscn")
