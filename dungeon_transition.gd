extends Area2D

@export var next_scene : String
@export var label : Label
@export var timer : Timer

@onready var animation_tex : TextureRect = $TextureRect
@onready var animation_player : AnimationPlayer = $AnimationPlayer

var inside_box : bool

func _ready():
	label.visible = false
	animation_tex.visible = false
	
func _on_body_entered(body):
	inside_box = true
	label.visible = true
	get_tree().change_scene_to_file(next_scene)

func _process(delta):
	if inside_box == true:
		if Input.is_action_just_pressed("interact"):
			play()
			timer.start()
				#get_tree().change_scene_to_file(next_scene)

func _on_body_exited(body):
	inside_box = false
	label.visible = false

func play():
	animation_player.queue("fade_out")

#func _on_timer_timeout():
	#get_tree().change_scene_to_file(next_scene)
