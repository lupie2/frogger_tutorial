extends CharacterBody2D

var direction: Vector2 
var speed: int = 100

# for physics
func _physics_process(_delta: float) -> void:
	direction = Input.get_vector('left', 'right', 'up', 'down')
	#position += direction * speed
	velocity = direction * speed
	animation()
	move_and_slide()

func animation():
	if direction:
		#if direction.x > 0:
		#	$AnimatedSprite2D.flip_h = true
		#else:
		#	$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.flip_h = direction.x > 0
		if direction.x != 0:
			$AnimatedSprite2D.animation = 'left'
		else:
			$AnimatedSprite2D.animation = 'up' if direction.y < 0 else 'down'
	else:
		$AnimatedSprite2D.frame = 0 #stops playing animation andd shows frame 0 
