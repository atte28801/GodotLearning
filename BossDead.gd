extends State

@export var dead_animation_node : String = "dead"

@export var sideareadetect : Area2D
@export var centerareadetect : Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#sideareadetect.monitoring = false
	#centerareadetect.monitoring = false
	
func on_enter():
	sideareadetect.monitoring = false
	centerareadetect.monitoring = false
	playback.travel(dead_animation_node)
