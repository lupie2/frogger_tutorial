extends Node2D

var car_scene: PackedScene = preload("res://scenes/car.tscn")
var score: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_finish_area_2d_body_entered(_body: Node2D) -> void:
	call_deferred('change_scene') #avoids error when removing CollisionObject during physics callback
	if score > Global.score:
		Global.score = score
	
func change_scene(): #tells the game to change scene without error
	get_tree().change_scene_to_file("res://scenes/title.tscn")
	if score > Global.score:
		Global.score = score

func _on_car_timer_timeout():
	var car = car_scene.instantiate() as Area2D #instantiates a car to spawn
	var pos_marker = $CarStartPositions.get_children().pick_random() as Marker2D #picks a random marker from the CarStartPositions for a car to spawn
	car.position = pos_marker.position
	$Objects.add_child(car) #new cars will be spawned within the Objects node to make it look more cleaner
	car.connect('body_entered', go_to_title)
	
func go_to_title(body):
	call_deferred('change_scene') #avoids error when removing CollisionObject during physics callback
	
func _on_score_timer_timeout() -> void:
	score += 1
	$CanvasLayer/Label.text = 'Time elapsed: ' + str(score)
