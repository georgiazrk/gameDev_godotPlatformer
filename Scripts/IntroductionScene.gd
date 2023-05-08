extends Control

func _ready():
	MusicController.play_menu_music()
	$AnimationPlayer.play("Fading")
	yield(get_tree().create_timer(6), "timeout")
	$AnimationPlayer.play("FadeOut")
	yield(get_tree().create_timer(3), "timeout")
	$Logo.visible = false
	$AnimationPlayer.play("Fading")
	yield(get_tree().create_timer(6), "timeout")
	$AnimationPlayer.play("FadeOut")
	yield(get_tree().create_timer(3), "timeout")
	get_tree().change_scene("res://Scenes/TitleMenu.tscn")
