extends State

@export var ground_state : State
@export var center_attack_name : String = "side_attack"
@export var return_animation_node : String = "move"

@export var side_attack_name : String = "side_attack"
@export var sideareadetect : Area2D
@export var side_state : State

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(sideareadetect.player_detected == true):
		next_state = side_state
		playback.travel(side_attack_name)

func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == center_attack_name):
		next_state = ground_state
		playback.travel(return_animation_node)
