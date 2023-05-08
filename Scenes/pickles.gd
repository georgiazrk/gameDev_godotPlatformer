extends KinematicBody2D

var speed = 50
var velocity = Vector2()
export var direction = -1

func _ready():
	if direction == 1:
		$AnimatedSprite.flip_h = true
	$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction


func _physics_process(delta):
	
	if is_on_wall() or not $floor_checker.is_colliding() and is_on_floor():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
		
	velocity.y += 20
	
	velocity.x = speed * direction
	
	velocity = move_and_slide(velocity, Vector2.UP)


func _on_sides_checker_body_entered(body):
	if body.get_collision_layer() == 1: #if player
		body.ouch(position.x)
	elif body.get_collision_layer() == 32: #if fireball
		speed = 0
		$AnimatedSprite.play("die")
		$oinkFX.play()
		set_collision_layer_bit(4, false)
		set_collision_mask_bit(0, false)
		$sides_checker.set_collision_layer_bit(0, false)
		$sides_checker.set_collision_mask_bit(0, false)
		$sides_checker.set_collision_mask_bit(5, false)
		$Timer.start()
		body.queue_free()


func _on_Timer_timeout():
	queue_free()
