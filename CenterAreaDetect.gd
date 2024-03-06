extends Area2D

@export var ground_state : State

var center_player_detected : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	center_player_detected = true

func _on_body_exited(body):
	center_player_detected = false
