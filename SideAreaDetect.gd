extends Area2D

@export var ground_state : State

var player_detected : bool = false

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	player_detected = true

func _on_body_exited(body):
	player_detected = false
