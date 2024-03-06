extends Area2D

@export var damage : int = 50
@export var player : Player
@export var facing_shape : FacingCollisionShape2D
# Called when the node enters the scene tree for the first time.
func _ready():
	monitoring = false
	player.connect("facing_direction_changed", _on_player_facing_direction_changed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	for child in body.get_children():
		if child is Damageable:
			child.hit(damage)
			print_debug(body.name + " took " + str(damage))

func _on_player_facing_direction_changed(facing_right : bool):
	if(facing_right):
		facing_shape.position = facing_shape.facing_right_position
	else:
		facing_shape.position = facing_shape.facing_left_position
