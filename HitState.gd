extends State

class_name HitState

@export var damageable : Damageable
@export var dead_state: State
@export var dead_animation_node : String = "dead"
@export var knockback_velocity : Vector2 = Vector2(100, -50)
@export var return_state : State

@onready var timer : Timer = $HitTimer
# Called when the node enters the scene tree for the first time.

func _ready():
	damageable.connect("on_hit", on_damageable_hit)

func on_enter():
	timer.start()
	character.velocity = knockback_velocity

func on_damageable_hit(node : Node, damage_amount : int):
	if(damageable.health > 0):
		emit_signal("interrupt_state", self)
	else:
		emit_signal("interrupt_state", dead_state)
		playback.travel(dead_animation_node)

func _on_timer_timeout():
	next_state = return_state
