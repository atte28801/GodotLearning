extends CharacterBody2D

class_name Boss

@export var speed = 150.0
@export var player = CharacterBody2D
@export var damageable : Damageable
@export var dead_state: State
@export var dead_animation_node : String = "dead"

@onready var animation_tree : AnimationTree = $AnimationTree
@onready var sprite: Sprite2D = $Sprite2D
@onready var navigation_agent : NavigationAgent2D = $NavigationAgent2D

@onready var state_machine: CharacterStateMachine = $CharacterStateMachine #########

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

signal facing_direction_changed(facing_right : bool)

func _ready():
	pass

func _physics_process(delta):
	update_animation_parameters()
	update_facing_direction()
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if state_machine.check_if_can_move() == true: ###
		var direction = to_local(navigation_agent.get_next_path_position()).normalized()
		velocity.x = direction.x * speed
		move_and_slide()
	#else:
		#velocity.x = 0 ###
	
	##### PROBABLY MOVE SOME OF THE ABOVE MOTION SCRIPTING TO IDLE STATE
func update_facing_direction():
	if velocity.x > 0:
		sprite.flip_h = false
	elif velocity.x <0:
		sprite.flip_h = true

	emit_signal("facing_direction_changed", !sprite.flip_h)

func create_path():
	navigation_agent.target_position = player.global_position
	print_debug(str(navigation_agent.get_final_position())) ##

func _on_timer_timeout():
	create_path()
	
func update_animation_parameters():
	animation_tree.set("parameters/move/blend_position", velocity.x)

func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == dead_animation_node):
		queue_free()
