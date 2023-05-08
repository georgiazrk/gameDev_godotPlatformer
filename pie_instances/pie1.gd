extends Area2D

signal pie1collected

func _on_pie1_body_entered(body):
	$Timer.start()
	$Sprite.visible = false
	$CollisionShape2D.queue_free()
	$AudioStreamPlayer2D.play()
	body.add_pie()
	emit_signal("pie1collected")
	
	


func _on_Timer_timeout():
	queue_free()
	
