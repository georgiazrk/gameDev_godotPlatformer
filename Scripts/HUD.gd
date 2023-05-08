extends CanvasLayer

var coins = Global.coins

func _ready():
	$Coins.text = str(Global.coins)
	load_hearts()
	Global.hud = self

func _on_coin_collected():
	Global.coins += 1
	print(Global.coins)
	_ready()
	
func load_hearts():
	$HeartsFull.rect_size.x = Global.lives * 16
	$HeartsEmpty.rect_size.x = (Global.max_lives - Global.lives) * 16
	$HeartsEmpty.rect_position.x = $HeartsFull.rect_position.x + $HeartsFull.rect_size.x * $HeartsFull.rect_scale.x



func _on_pie1_pie1collected():
	$Pie1.modulate.a = 1


func _on_pie2_pie2collected():
	$Pie2.modulate.a = 1


func _on_pie3_pie3collected():
	$Pie3.modulate.a = 1


