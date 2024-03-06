extends Area2D

@export var npc_shape : CollisionShape2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

@export var label : Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	label.visible = true

func _on_body_exited(body):
	label.visible = false
