extends Area2D

@export var next_scene : String
@export var label : Label

var inside_box : bool

func _on_body_entered(body):
	inside_box = true
	label.visible = true
# Called when the node enters the scene tree for the first time.
func _ready():
	label.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if inside_box == true:
		if Input.is_action_just_pressed("interact"):
			get_tree().change_scene_to_file(next_scene)

func _on_body_exited(body):
	inside_box = false
	label.visible = false
