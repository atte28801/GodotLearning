extends Area2D

@export var dialog_path : DialogueResource
@export var dialog_start : String = ""
@export var collision : CollisionShape2D

var inside_box : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if inside_box == true:
		if Input.is_action_just_pressed("interact"):
			DialogueManager.show_dialogue_balloon(dialog_path, dialog_start)
			
		
func _on_body_entered(body):
	inside_box = true
	#DialogueManager.show_example_dialogue_balloon(dialog_path, dialog_start)
	
func _on_body_exited(body):
	inside_box = false
	
#func get_input():
	#if inside_box == true && Input.is_action_pressed("interact"):
		#DialogueManager.show_example_dialogue_balloon(dialog_path, dialog_start)
