extends State

class_name GroundState
	
@export var jump_velocity : float = -200.0
@export var air_state: State
@export var jump_animation : String = "jump"
@export var attack_state : State
@export var attack_node : String = "attack1"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func state_process(delta):
	if(!character.is_on_floor()):
		next_state = air_state

func state_input(event : InputEvent):
	if(event.is_action_pressed("ui_accept")):
		jump()
	if(event.is_action_pressed("attack")):
		attack()
		
func jump():
	character.velocity.y = jump_velocity
	next_state = air_state
	playback.travel(jump_animation)

func attack():
	next_state = attack_state
	playback.travel(attack_node)
