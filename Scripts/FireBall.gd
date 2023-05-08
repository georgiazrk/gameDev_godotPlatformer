extends KinematicBody2D

signal fireball

var velocity = Vector2()
var direction = 1

const SPEED = 800

func _ready():
	velocity.x = SPEED *  direction
	
func _physics_process(delta):
	if is_on_wall():
		queue_free()
		
	velocity = move_and_slide(velocity, Vector2.UP)
	
	


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
