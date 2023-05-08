extends Control

func _ready():
	pass

func _input(event):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://Scenes/TitleMenu.tscn")


func _on_BackBtn_pressed():
	get_tree().change_scene("res://Scenes/TitleMenu.tscn")
