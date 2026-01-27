extends Node2D

var direction: Vector2 = Vector2(1, 1)
var speed: int = 5

# for physics
func _physics_process(_delta: float) -> void:
	direction = Input.get_vector('left', 'right', 'up', 'down')
	position += direction * speed
