extends State

@export var side_state : State
@export var sideareadetect : Area2D
@export var side_attack : String = "side_attack"

@export var centerareadetect : Area2D
@export var center_state : State
@export var center_attack : String = "center_attack"

@export var ground_state: State

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(sideareadetect.player_detected == true):
		next_state = side_state
		playback.travel(side_attack)
	elif(centerareadetect.center_player_detected == true && sideareadetect.player_detected == false):
		next_state = center_state
		playback.travel(center_attack)
		return
	else:
		next_state = ground_state
		return
