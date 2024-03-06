extends State

@export var ground_state : State
@export var side_attack_name : String = "side_attack"
@export var return_animation_node : String = "move"

@export var centerareadetect : Area2D
@export var sideareadetect : Area2D
@export var center_state : State

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(centerareadetect.center_player_detected == true && sideareadetect.player_detected == false):
		next_state = center_state
		#next_state = ground_state
		#playback.travel(return_animation_node)
	
func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == side_attack_name):
		next_state = ground_state
		playback.travel(return_animation_node)
