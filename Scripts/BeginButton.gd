extends Button


func _ready():
	pass


func _on_BeginButton_pressed():
	Global.lives = Global.max_lives
	get_tree().change_scene("res://Scenes/Level1.tscn")
