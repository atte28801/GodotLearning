extends Node2D

@onready var animation_tex : TextureRect = $TextureRect
@onready var animation_player : AnimationPlayer = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	animation_tex.visible = false
	animation_player.queue("fade_in")

# Called every frame. 'delta' is the elapsed time since taahe previous frame.
func _process(delta):
	pass
