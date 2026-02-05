extends Area2D

var direction = Vector2.LEFT
var speed = 100
var colors = [
	preload("res://graphics/cars/green.png"),
	preload("res://graphics/cars/red.png"),
	preload("res://graphics/cars/yellow.png")
	]

func _ready() -> void: #is called when new scene is added to the tree
	if position.x < 500:
		direction.x = 1 #turns vector2.LEFT to RIGHT
		$Sprite2D.flip_h = true #mirros the sprite so that the animation looks right
	$Sprite2D.texture = colors.pick_random()

func _process(delta: float) -> void:
	position += direction * speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free() #destroys current instance of the node, in this case whenever the spawned car exits the screen
