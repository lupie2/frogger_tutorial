extends Node2D

var car_scene: PackedScene = preload("res://scenes/car.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_finish_area_2d_body_entered(body: Node2D) -> void:
	print('player entered')


func _on_car_timer_timeout():
	var car = car_scene.instantiate() as Area2D #instantiates a car to spawn
	var pos_marker = $CarStartPositions.get_children().pick_random() as Marker2D #picks a random marker from the CarStartPositions for a car to spawn
	car.position = pos_marker.position
	$Objects.add_child(car) #new cars will be spawned within the Objects node to make it look more cleaner
	car.connect('body_entered', go_to_title)
	
func go_to_title(body):
	print(body)
	print('player collisioned')
	
