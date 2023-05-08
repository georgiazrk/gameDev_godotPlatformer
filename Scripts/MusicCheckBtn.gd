extends CheckButton

func _ready():
	pass


func _on_MusicCheckBtn_toggled(button_pressed):
	MusicController.stop_level_music()
