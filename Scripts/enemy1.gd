extends KinematicBody2D

var speed = 50
var velocity = Vector2()
export var direction = -1
var rng = RandomNumberGenerator.new()

func _ready():
	if direction == 1:
		$AnimatedSprite.flip_h = true
	$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	generate_random_timer()

func _physics_process(delta):
	
	if is_on_wall() or not $floor_checker.is_colliding() and is_on_floor():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
		
	velocity.y += 20
	
	velocity.x = speed * direction
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
func generate_random_timer():
	var random_time = rng.randf_range(0.1, 5)
	yield(get_tree().create_timer(random_time), "timeout")
	$pigOinkFX.play()
	generate_random_timer()
	

func _on_top_checker_body_entered(body):
	$AnimatedSprite.play("die")
	$pigSquealFX.play()
	speed = 0
	set_collision_layer_bit(4, false)
	set_collision_mask_bit(0, false)
	$top_checker.set_collision_layer_bit(4, false)
	$top_checker.set_collision_mask_bit(0, false)
	$sides_checker.set_collision_layer_bit(4, false)
	$sides_checker.set_collision_mask_bit(0, false)
	$Timer.start()
	body.bounce()

func _on_sides_checker_body_entered(body):
	if body.get_collision_layer() == 1:
		body.ouch(position.x)
	elif body.get_collision_layer() == 32:
		speed = 0
		$AnimatedSprite.play("die")
		$pigSquealFX.play()
		set_collision_layer_bit(4, false)
		set_collision_mask_bit(0, false)
		$top_checker.set_collision_layer_bit(4, false)
		$top_checker.set_collision_mask_bit(0, false)
		$sides_checker.set_collision_layer_bit(4, false)
		$sides_checker.set_collision_mask_bit(0, false)
		$sides_checker.set_collision_mask_bit(5, false)
		$Timer.start()
		body.queue_free()
	

func _on_Timer_timeout():
	queue_free()
