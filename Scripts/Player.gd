extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const MAX_SPEED = 200
const JUMP_HEIGHT = -500
const ACCELERATION = 50
const FIREBALL = preload("res://Scenes/FireBall.tscn")

var motion = Vector2()
var pies = 0
var area_entered = 0

func _ready():
	pies = 0
	Global.current_level = get_tree().current_scene.name

func _physics_process(delta):
	
	##gravity
	motion.y += GRAVITY
	
	##friciton
	var friction = false
	
	##right movement - right arrow key
	if Input.is_action_pressed("ui_right"):
		if is_on_floor():
			if not $runFX.is_playing():
				$runFX.play()
		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
		$Sprite.flip_h = false
		$Sprite.play("run")
	##left movement - left arrow key
	elif Input.is_action_pressed("ui_left"):
		if is_on_floor():
			if not $runFX.is_playing():
				$runFX.play()
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play("run")
	else:
		$runFX.stop()
		$Sprite.play("idle")
		friction = true
		motion.x = lerp(motion.x, 0, 0.2)
		
	
	##jump movement - up arrow key
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
			$runFX.stop()
			$jumpFX.play()
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if motion.y < 0:
			$Sprite.play("jump")
		else:
			$runFX.stop()
			$Sprite.play("fall")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
		
	motion = move_and_slide(motion, UP)
	fire()
	
func fire():
	if Input.is_action_just_pressed("ui_select"):
		var direction = 1 if not $Sprite.flip_h else -1
		var f = FIREBALL.instance()
		$fireFX.play()
		f.direction = direction
		if f.direction == 1:
			f.get_node("AnimatedSprite").flip_h = false
		else:
			f.get_node("AnimatedSprite").flip_h = true
		get_parent().add_child(f)
		f.position.y = position.y
		f.position.x = position.x + 25 * direction
		
	
func _on_fallzone_body_entered(body):
	emit_signal("current_level")
	$fallFX.play()
	$fallTimer.start()
	
	
func add_pie():
	var level = get_tree().current_scene.name
	pies = pies + 1
	print("+1 ", pies)
	if pies == 3:
		$pieTimer.start()
		
	if level == "World2" && pies == 3:
		$l2pietimer.start()

func bounce():
	motion.y = JUMP_HEIGHT * 0.7
	
func ouch(var enemyposx):
	$Timer.start()
	$hurtFX.play()
	Global.lose_life()
	set_modulate(Color(1, 0.3, 0.3, 0.3))
	motion.y = JUMP_HEIGHT * 0.5
	
	#if to left of enemy
	if position.x < enemyposx:
		motion.x = -300
	elif position.x > enemyposx:
		motion.x = 300
		
	Input.action_release("ui_left")
	Input.action_release("ui_right")


func _on_Timer_timeout():
	set_modulate(Color(1,1,1,1))

func _on_fallTimer_timeout():
	get_tree().change_scene("res://Scenes/GameOver.tscn")


func _on_pieTimer_timeout():
	print("timer")
	get_tree().change_scene("res://Scenes/Level2.tscn")


func _on_l2pietimer_timeout():
	get_tree().change_scene("res://Scenes/Win.tscn")


func _on_bossArea_body_entered(body):
	MusicController.play_boss_fight_music()


func _on_bossArea_body_exited(body):
	MusicController.play_music()
