extends Control


func _ready():
	MusicController.play_win_music()
	$AnimationPlayer.play("FadeOut")
	yield(get_tree().create_timer(3), "timeout")
	$YouWin.visible = false
	$AnimationPlayer.play("Fading")
	yield(get_tree().create_timer(8), "timeout")
	$AnimationPlayer.play("FadeOut")
	yield(get_tree().create_timer(3), "timeout")
	get_tree().change_scene("res://Scenes/TitleMenu.tscn")


func _on_Tween_tween_completed(object, key):
	pass # Replace with function body.
